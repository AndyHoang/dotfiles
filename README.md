# My dotfiles

## Breaking change to stow

* Start to use stow to manage my dotfiles

## Usage
* `stow -t ~ stow`
* `stow --dotfiles vim`
* `stow -vv coc -t ~/.vim`
* `stow -vv --dotfiles dot-config -t ~/.config`
* `stow -vv custom-snippets/ -t ~/.vim`
* `cd @arch && stow --dotfiles zsh`
* `cd @macos && stow --dotfiles tmux`


## Fix GRUB to your existing arch (me using kernel `linux`)
- boot to liveiso (WITH EFI)
- arch-chroot
    ```sh
    mount /dev/sda6 /mnt # (sda6 is your installation disk)
    arch-chroot /mnt
    mount /dev/sda2 /efi # mount correct esp directory
    mkinitcpio -P linux # (generate /boot/**image) if needed (if you dont mount esp to `/boot` you  cant) (me don't know why)
    grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=arch_grub2 --recheck --debug # optional (fix grub menu entry), dont know when should yet
    grub-mkconfig -o /boot/grub/grub.cfg # dont dont
    ```
- Check fstab: `UUID=F81C-AD65                            /efi      vfat    defaults,noatime 0 2`

## Installing new gpu (AMD -> Nvidia)

* After install `nvidia` package, make sure to reinstall `linux` kernels (took me 5 hours)
* TODO wait for this fix `May 29 23:38:28 andyhoang-pc kernel: nvidia-gpu 0000:06:00.3: i2c timeout error e0000000` (1660)
* Remove unused `amdvkl` package

## Stop mouse wake up
 `sudo ln  udev/rules.d/wakeup.rules /etc/udev/rules.d`

## tmux power draw (Arch)
Status bar shows `⚡<W>`: CPU package + RAM (Intel RAPL) + GPU (amdgpu), averaged over `status-interval`.
Board/drives/fans/PSU loss have no sensor, so wall draw is ~20-40W higher.

* `mkdir -p ~/.tmux/plugins` first, otherwise stow links all of `~/.tmux` into the repo and tpm installs plugins there
* `cd @arch && stow --dotfiles -t ~ tmux` (links `~/.tmux.conf` and `~/.tmux/power.sh`)
* Allow reading RAPL without root, from repo root (one-time; reapplied every boot):
    ```sh
    # rapl.conf grants group `andyhoang`; change it if your group differs (`id -gn`)
    sudo cp @arch/etc/tmpfiles.d/rapl.conf /etc/tmpfiles.d/
    sudo systemd-tmpfiles --create /etc/tmpfiles.d/rapl.conf
    ```
    Kept group-only, not world-readable, because of the RAPL side-channel (CVE-2020-8694)
* Check: `~/.tmux/power.sh` twice; the CPU part appears from the 2nd run
* Without this step, or on AMD CPU / Nvidia GPU, it only shows the parts it can read

## Wi-Fi as fallback for wired (NetworkManager, Arch)
Wired `eno1` is primary; Wi-Fi `wlan0` comes up only while the cable is out, never both at once
(two NICs on one subnet → peers cache the wrong MAC → packets silently dropped).
`eno1` down → `nmcli device connect wlan0`; `eno1` up → `nmcli device disconnect wlan0`.
Both links carry the **same static LAN IP**, so LAN clients (NFS, Jellyfin…) never notice the switch.

Values for the HTPC (`andy-htpc`): IP `192.168.50.173/24`, gateway/DNS `192.168.50.1`.

1. Pin the IP on the **wired** profile (don't rely on DHCP) — check the name with `nmcli con`
    ```sh
    sudo nmcli con modify "Wired connection 1" ipv4.method manual \
      ipv4.addresses 192.168.50.173/24 ipv4.gateway 192.168.50.1 ipv4.dns 192.168.50.1
    sudo nmcli con up "Wired connection 1"
    ```
    Also add a DHCP reservation on the router for the wired MAC → `.173`, so the router never hands that IP to another device
2. Install the dispatcher script, from repo root. **Copy, don't stow/symlink**: NM only runs scripts owned by root and not group/other-writable
    ```sh
    sudo install -m 755 -o root -g root @arch/etc/NetworkManager/dispatcher.d/70-wifi-fallback /etc/NetworkManager/dispatcher.d/
    systemctl is-enabled NetworkManager-dispatcher   # must be enabled
    ```
    Re-run the `install` after editing the script in the repo. Edit `eno1`/`wlan0` in the script if the NIC names differ (`nmcli dev`)
3. Stop Wi-Fi auto-joining while the cable is still in (lasts until reboot; the script handles it after that)
    ```sh
    sudo nmcli device set wlan0 autoconnect no
    ```
4. Home Wi-Fi profile pinned to the **same** static IP, using the card's real MAC (not randomized)
    ```sh
    sudo nmcli con add type wifi ifname wlan0 con-name "Home WiFi" ssid <SSID> \
      wifi-sec.key-mgmt wpa-psk wifi.cloned-mac-address permanent \
      ipv4.method manual ipv4.addresses 192.168.50.173/24 \
      ipv4.gateway 192.168.50.1 ipv4.dns 192.168.50.1 ipv4.route-metric 600 \
      ipv6.method disabled connection.autoconnect yes
     sudo nmcli con modify "Home WiFi" wifi-sec.psk '<password>'   # leading space = not in shell history
    ```
    `--ask` on `con add` does NOT prompt for the password; set it with `con modify`. Other networks: `sudo nmcli --ask dev wifi connect "<SSID>"` (DHCP)
5. Verify the IP is pinned on both
    ```sh
    nmcli -g ipv4.method,ipv4.addresses con show "Wired connection 1"   # manual / 192.168.50.173/24
    nmcli -g ipv4.method,ipv4.addresses con show "Home WiFi"            # manual / 192.168.50.173/24
    ```
6. Test: `journalctl -t wifi-fallback -f`, pull the cable → `eno1 down -> connecting wlan0` and `ip -br a` shows `.173` on `wlan0`; plug back → `eno1 up -> disconnecting wlan0` and `.173` on `eno1`

Boot headless (text login, desktop on demand via `startplasma-wayland` or `sudo systemctl start sddm`):
`sudo systemctl set-default multi-user.target`, and empty the `[Autologin]` block in `/etc/sddm.conf`

## Note
- xclip for vim/neovim and system clipboard to synced without additional config

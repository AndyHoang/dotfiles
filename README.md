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

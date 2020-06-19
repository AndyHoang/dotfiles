# My dotfiles

## Breaking change to stow

* Start to use stow to manage my dotfiles

## Current working with stow:
* vim
* tmux
* flake
* zsh
* weechat

## Usage
* `stow -t ~ stow`
* `stow --dotfiles vim`
* `cd @arch && stow --dotfiles zsh`
* `stow -vv --dotfiles dot-config -t ~/.config`


# GRUB with arch

- mount correct esp directory (mount /dev/sda2 /mnt/boot/efi) (not only /mnt/boot)
- make sure  `mkinicpio -P linux-lts` or `mkinicpio -P linux` runable (generate /boot/**image)
- `grub-mkconfig -o /boot/grub/grub.cfg` to have them linux or linux-lts
- grub-install if needed: `grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug`
- make another grub-mkconfig to make sure


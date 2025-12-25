#!/usr/bin/bash

# 03/2024 : dropped initrd=amd-ucode, now provided by mkinitcpio in the main ramfs

kernel_cmdline='root=/dev/mapper/cryptroot rw initrd=\initramfs-linux.img'

# Create nvram boot entry
disk='/dev/disk/by-id/ata-Samsung_SSD_850_EVO_500GB_S2RBNX0JC37631P'
efibootmgr --verbose --disk "$disk" --part 1 --create --label 'Arch Linux' --loader /vmlinuz-linux --unicode "$kernel_cmdline"

# Create UEFI shell script
# echo "vmlinuz-linux $kernel_cmdline" > /boot/startup.nsh


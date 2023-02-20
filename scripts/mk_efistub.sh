#!/usr/bin/bash

kernel_cmdline='root=/dev/mapper/cryptroot rw initrd=\amd-ucode.img initrd=\initramfs-linux.img'

# Create nvram boot entry
efibootmgr --verbose --disk /dev/sda --part 1 --create --label 'Arch Linux' --loader /vmlinuz-linux --unicode "$kernel_cmdline"

# Create UEFI shell script
echo "vmlinuz-linux $kernel_cmdline" > /boot/startup.nsh


#!/bin/bash
 
exec 2>/dev/console
exec 1>/dev/console
 
echo "        --- Debian 12 Patchstick Mod ---"
echo "        *** This process will delete ALL data from your Apple TV's hard drive ***"
echo "        *** Back up any important data before continuing ***"

read -rsp $'        *** Press any key to continue...\n' -n 1 key

echo "        * Initializing"
mount /dev/sdb2 /mnt
mkdir /media/debianinstaller
mount /dev/sdc /media/debianinstaller

echo "        * Flashing hd-boot.img to Apple TV hard drive. Please wait, this may take a while."
dd if=/mnt/hd-boot.img of=/dev/sda bs=1M
parted --script /dev/sda print fix
echo "        * Complete! Proceeding with the Debian installer."

kexec --load /media/debianinstaller/install.386/vmlinuz --initrd=/media/debianinstaller/install.386/initrd.gz --command-line="root=/dev/sda video=vesafb" 

echo "        * Booting Debian Installer"
##kexec -e

echo "        * If you see this message, something went wrong. Make sure you have a Debian 12 (i386/32-bit) installer on a USB drive."
echo "        * You can also open an issue at https://github.com/bigfloppa234/atv-tomfoolery/issues"
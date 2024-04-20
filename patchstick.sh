#!/bin/bash
 
exec 2>/dev/console
exec 1>/dev/console
 
echo "        --- Debian 12 Patchstick Mod ---"
 
echo "        * Initializing"
mount /dev/sdc /mnt
kexec --load /mnt/install.386/vmlinuz --initrd=/mnt/install.386/initrd.gz --command-line="video=vesafb" 

echo "        * Booting to Debian"
kexec -e

echo "        * If you see this message, something went wrong. Make sure you have a Debian 12 (i386/32-bit) installer on a USB drive."
echo "        * You can also open an issue at https://github.com/bigfloppa234/atv-tomfoolery/issues"
#!/bin/bash
dd if=/dev/zero of=/dev/$1 bs=1024 count=1
#fdisk -l /dev/$1fdisk /dev/$1
fdisk /dev/$1 <<EEOF
x
h
255
s
63
c
960
r
n
p
1
1
+200M
n
p
2
27
960
a
1
t
1
c
t
2
83
p
w
EEOF
mkfs.vfat -F 32 -n boot /dev/$1\1
mkfs.ext4 -L root /dev/$1\2
echo "Remove SD card and re-insert"
exit 0

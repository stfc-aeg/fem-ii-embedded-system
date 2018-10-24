rm -rf /media/root/*
cp ../rootfs.tar /media/root/
cd /media/root/
tar -xpf rootfs.tar
cd -
cp -r ../home/ /media/root/
cp -r ../root/* /media/root/root/
rm -rf /media/root/etc/resolv.conf /media/root/etc/hostname /media/root/etc/network/interfaces
cp hostname ../resolv.conf ../ntp.conf /media/root/etc
cp interfaces /media/root/etc/network
cp ../S60QEMserver /media/root/etc/init.d/
rm -rf /media/boot/*
cp -r ../boot/* /media/boot/

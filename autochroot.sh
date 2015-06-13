# we download archlinux fs from web
wget archlinux.mirrors.ovh.net/archlinux/iso/2015.06.01/arch/x86_64/airootfs.sfs
unsquashfs -d /squashfs-root airootfs.sfs

# we create temp arch system
mkdir /arch
mount -o loop /squashfs-root/airootfs.img /arch
mount -t proc none /arch/proc
mount -t sysfs none /arch/sys
mount -o bind /dev /arch/dev
mount -o bind /dev/pts /arch/dev/pts
cp -L /etc/resolv.conf /arch/etc
mkdir /arch/run/shm

# we install the script that will be used
wget http://dl.leneveu.fr/public/autoinstall.sh
mv autoinstall.sh /arch

# we chroot into temp arch environment
chroot /arch bash

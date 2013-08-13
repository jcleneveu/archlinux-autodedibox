# we download archlinux fs from web
wget http://archlinux.mirrors.ovh.net/archlinux/iso/2013.08.01/arch/x86_64/root-image.fs.sfs
unsquashfs -d /squashfs-root root-image.fs.sfs

# we create temp arch system
mkdir /arch
mount -o loop /squashfs-root/root-image.fs /arch
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
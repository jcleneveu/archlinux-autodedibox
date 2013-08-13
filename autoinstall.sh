mkfs.ext2 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda3

haveged -w 1024
pacman-key --init
pacman-key --populate archlinux
pkill haveged

pacstrap /mnt base base-devel syslinux zsh openssh
genfstab -U -p /mnt >> /mnt/etc/fstab

wget http://dl.leneveu.fr/public/autoconfigure.sh
mv autoconfigure.sh /mnt

arch-chroot /mnt
# hostname
echo "jc-server" >> /etc/hostname

# locale
echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=\"fr_FR.UTF-8\"" >> /etc/locale.conf
export LANG=fr_FR.UTF-8
echo "KEYMAP=fr-pc" >> /etc/vconsole.conf
locale-gen
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

# mkinitcpio
mkinitcpio -p linux

# syslinux
sed -i -e "s/sda3/sda2/g" /boot/syslinux/syslinux.cfg
syslinux-install_update -iam

# root passwd
passwd

# main user passwd
useradd -g users -m -s /bin/zsh jc
passwd jc

# openssh & network
systemctl enable sshd.service
systemctl enable dhcpcd.service
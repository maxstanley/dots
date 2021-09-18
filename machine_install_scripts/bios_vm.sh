#!/bin/bash

# Set the Keyboard layout.
loadkeys uk;

# Update the clock.
timedatectl set-ntp true;

# Wipe partition tables.
wipefs --all --force /dev/sda

(
echo -e "g\n"; # Create an empty GPT partition table.
echo -e "n\n\n\n+512M\n"; # Add a new EFI Partition.
echo -e "t\n82\n"; # Make the partition type EFI System.
echo -e "t\n2\n30\n"; # Make the partition type Linux LVM.
echo -e "w\n"; # Write Changes.
) | fdisk /dev/sda

# Format the partitions.
mkswap /dev/sda1; # Swap Partition.
mkfs.ext4 /dev/sda2; # Home Partition.

# Mount partitions.
swapon /dev/sda1
mount /dev/sda2 /mnt/;

# Add mirrors.
curl "https://archlinux.org/mirrorlist/?country=GB&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist;

# Remove comments from mirrorlist.
sed -i 's/#Server/Server/g' /etc/pacman.d/mirrorlist;

# Install Essential packages.
pacstrap /mnt \
	base \
	linux \
	linux-headers \
	linux-firmware \
	sudo \
	openssh \
	dhcpcd \
	grub \
	intel-ucode;

# Generate fstab.
mkdir /mnt/etc;
genfstab -U -p /mnt >> /mnt/etc/fstab;

# Change root command.
CHROOT="arch-chroot /mnt";

# Set timezone.
$CHROOT ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime;

# Generate adjtime.
$CHROOT hwclock --systohc;

# Set Localisation.
$CHROOT locale-gen;
$CHROOT echo "LANG=en_GB.UTF-8" > /etc/locale.conf;

$CHROOT echo "KEYMAP=uk" > /etc/vconsole.conf

$CHROOT echo "LANG=en_GB.UTF-8" > /etc/default/locale;
$CHROOT echo "LC_ALL=en_GB.UTF-8" >> /etc/default/locale;
$CHROOT echo "LANGUAGE=en_GB.UTF-8" >> /etc/default/locale;

# Network Configuration.
$HOST="vm"
$CHROOT echo "$HOST" > /etc/hostname
$CHROOT echo "127.0.0.1	localhost" > /etc/hosts;
$CHROOT echo "127.0.0.1	${HOST}.localdomain	${HOST}" >> /etc/hosts;
$CHROOT echo "::1		localhost" >> /etc/hosts;

$CHROOT mkinitcpio -P

$CHROOT grub-install --target=i386-pc /dev/sda;
$CHROOT grub-mkconfig -o /boot/grub/grub.cfg;

# Set Root password.
$CHROOT echo -e "SuperSecret123\nSuperSecret123" | passwd;


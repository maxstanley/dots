#!/bin/bash

# Set the Keyboard layout.
loadkeys us;

# Update the clock.
timedatectl set-ntp true;

(
echo -e "g\n"; # Create an empty GPT partition table.
echo -e "n\n\n\n+512M\n"; # Add a new partition.
echo -e "t\n1\n1\n"; # Make the partition type EFI System.
echo -e "n\n\n\n\n"; # Add a main partition.
echo -e "t\n2\n20\n"; # Make the partition type Linux FS.
echo -e "w\n" # Write Changes.

) | fdisk /dev/sda`

# Format the partitions.
mkfs.fat -F32 /dev/sda1;
mkfs.ext4 /dev/sda2;

# Add mirrors.
curl "https://archlinux.org/mirrorlist/?country=GB&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist;

# Remove comments from mirrorlist.
sed -i 's/#Server/Server/g' /etc/pacman.d/mirrorlist;

# Mount partitions.
mount /dev/sda2 /mnt/;
mkdir -p /mnt/boot/efi/;
mount /dev/sda1 /mnt/boot/efi/;

# Install Essential packages.
pacstrap /mnt base linux-lts linux-lts-headers linux-firmware iwd dhcpcd;

# Install non-essential packages.
pacstrap /mnt \
				tmux \
				dhcpcd \
				iwd \
				sudo \
				neovim \
				openssh \
				nftables \
				man-db \
				man-pages \
				wget \
				curl \
				git \
				base-devel \
				go \
				go-tools \
				python3 \
				python-pip \
				nodejs-lts-fermium \
				yarn \
				xorg-xinput \
				clang \
				openvpn \
				rustup \
				powertop \
				htop

# Generate an fstab file.
genfstab -U /mnt >> /mnt/etc/fstab;

# Change root command.
CHROOT="arch-chroot /mnt";

# Set timezone.
$CHROOT ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime;

# Generate adjtime.
$CHROOT hwclock --systohc;

# Set Localisation.
$CHROOT locale-gen;
$CHROOT echo "LANG=en_GB.UTF-8" > /etc/locale.conf;
$CHROOT echo "KEYMAP=us" > /etc/vconsole.conf
$CHROOT echo "LANG=en_GB.UTF-8" > /etc/default/locale;
$CHROOT echo "LC_ALL=en_GB.UTF-8" >> /etc/default/locale;
$CHROOT echo "LANGUAGE=en_GB.UTF-8" >> /etc/default/locale;

# Network Configuration.
$CHROOT echo "spectre" > /etc/hostname
$CHROOT echo "127.0.0.1	localhost" > /etc/hosts;
$CHROOT echo "127.0.0.1	spectre.localdomain	spectre" >> /etc/hosts;
$CHROOT echo "::1		localhost" >> /etc/hosts;

# Install Boot Loader.
$CHROOT pacman -S grub efibootmgr;
$CHROOT grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck;

# Update microcode.
$CHROOT pacman -S intel-ucode;
$CHROOT grub-mkconfig -o /boot/grub/grub.cfg;

# Set Root password.
echo "Set root password by running: passwd";


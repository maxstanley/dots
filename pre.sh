#!/bin/bash
# https://wiki.learnlinux.tv/index.php/How_to_Install_Arch_Linux_on_Encrypted_LVM#Create_EFI_partition

# Set the Keyboard layout.
loadkeys us;

# Update the clock.
timedatectl set-ntp true;

# Wipe partition tables.
wipefs --all --force /dev/sda

(
echo -e "g\n"; # Create an empty GPT partition table.
echo -e "n\n\n\n+512M\n"; # Add a new EFI Partition.
echo -e "t\n1\n"; # Make the partition type EFI System.
echo -e "n\n\n\n+512M\n"; # Create boot partition.
echo -e "n\n\n\n\n"; # Add a main partition.
echo -e "t\n2\n30\n"; # Make the partition type Linux LVM.
echo -e "w\n"; # Write Changes.

) | fdisk /dev/sda

# Format the partitions.
mkfs.fat -F32 /dev/sda1; # EFI Partition.
mkfs.ext4 -F /dev/sda2; # Boot Partition.

# Encrypt the Root Partition.
cryptsetup --cipher aes-xts-plain64 --key-file password.txt --batch-mode --use-random luksFormat /dev/sda3;
cryptsetup open --type luks --key-file password.txt /dev/sda3 lvm;

# Setup LVM
pvcreate --dataalignment 1m /dev/mapper/lvm;
vgcreate volgroup0 /dev/mapper/lvm;
lvcreate -L 50GB volgroup0 -n lv_root;
lvcreate -l100%FREE volgroup0 -n lv_home;
modprobe dm_mod;
vgscan;
vgchange -ay;

# Format the Root Partition.
mkfs.ext4 -F /dev/volgroup0/lv_root;
mkfs.ext4 -F /dev/volgroup0/lv_home;

# Mount partitions.
mount /dev/volgroup0/lv_root /mnt;
mkdir /mnt/boot;
mount /dev/sda2 /mnt/boot/;
mkdir /mnt/home;
mount /dev/volgroup0/lv_home /mnt/home/;

# Generate fstab.
mkdir /mnt/etc;
genfstab -U -p /mnt >> /mnt/etc/fstab;

# Add mirrors.
curl "https://archlinux.org/mirrorlist/?country=GB&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist;

# Remove comments from mirrorlist.
sed -i 's/#Server/Server/g' /etc/pacman.d/mirrorlist;

# Mount partitions.
# mount /dev/sda2 /mnt/;
# mkdir -p /mnt/boot/efi/;
# mount /dev/sda1 /mnt/boot/efi/;

# Install Essential packages.
pacstrap /mnt base linux-lts linux-lts-headers linux-firmware iwd dhcpcd;

# Install non-essential packages.
pacstrap /mnt \
				tmux \
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
				htop \
				lvm2

# Generate an fstab file.
# genfstab -U /mnt >> /mnt/etc/fstab;

# Change root command.
CHROOT="arch-chroot /mnt";

# Create initial ramdisk.
$CHROOT mkinitcpio -p linux-lts;

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
$CHROOT pacman -S grub efibootmgr dosfstools os-prober mtools;
sed -i 's/#GRUB_ENABLE_CRYPTODISK=y/GRUB_ENABLE_CRYPTODISK=y/g' /mnt/etc/default/grub
sed -i 's/quiet/cryptdevice=\/dev\/sda3:volgroup0:allow-discards quiet/g' /mnt/etc/default/grub

# Update microcode.
$CHROOT pacman -S intel-ucode;

mkdir /mnt/boot/EFI/
mount /dev/sda1 /mnt/boot/EFI;
$CHROOT grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck;
$CHROOT grub-mkconfig -o /boot/grub/grub.cfg;

# Create swap file.
fallocate -l 16G /mnt/swapfile;
chmod 600 /mnt/swapfile;
mkswap /mnt/swapfile;
echo '/swapfile none swap sw 0 0' | tee -a /mnt/etc/fstab;

# Set Root password.
$CHROOT echo -e "SuperSecret123\nSuperSecret123" | passwd;

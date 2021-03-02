# meushi's Arch Linux installation (2021.02)

Reference: https://wiki.archlinux.org/index.php/Installation_guide

## BIOS

* Boot\CSM disabled
* Boot\Secure Boot set to Other OS

## Basic install

* Boot on a USB key with Arch Linux ISO (not netinstall)

```loadkeys fr```

* Create disk layout

```
[root@meushi ~]# fdisk -l
Disk /dev/sda: 931,51 GiB, 1000204886016 bytes, 1953525168 sectors
Disk model: Samsung SSD 860 
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: F9E0FD17-177D-11EB-9E5A-DD0136727040

Device          Start        End    Sectors  Size Type
/dev/sda1        2048    1128447    1126400  550M EFI System
/dev/sda2     1128448  105986047  104857600   50G Linux root (x86-64)
/dev/sda3   105986048 1154562047 1048576000  500G Linux home
/dev/sda4  1154562048 1953525134  798963087  381G Linux filesystem
```

* Create filesystems

```
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
```

* Bootstrap ArchLinux

```
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
pacstrap /mnt base linux linux-firmware vim
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt
```

* Set time zone

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

* Generate locale

In **/etc/locale.gen**, uncomment:

```
en_US.UTF-8
fr_FR.UTF-8
```

```
locale-gen
```

* Set the keyboard layout  

Create **/etc/vconsole.conf**

```
KEYMAP=fr
```

* Set hostname

Create **/etc/hostname**

```
meushi
```

Edit **/etc/hosts**

```
127.0.0.1   localhost
::1		    localhost
127.0.1.1	meushi.localdomain	meushi
```

* Set root password

```
passwd
```

* Setup Grub with AMD microcode

```
pacman -S grub efibootmgr dosfstools mtools amd-ucode
grub-install --target=x86_64-efi --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

* Reboot

```
exit
reboot
```

* Login as **root** and setup network

Create **/etc/systemd/network/dhcp.network**

```
[Match]
Name=*
[Network]
DHCP=yes
```

```
systemctl start systemd-networkd
systemctl enable systemd-networkd
systemctl start systemd-resolved
systemctl enable systemd-resolved
```

## User creation

```
pacman -S zsh sudo base-devel git python3
groupadd -g 1000 viny
useradd -m -G wheel -u 1000 -g 1000 -s /bin/zsh viny
passwd viny
```

In **/etc/sudoers** uncomment:

```
%wheel ALL=(ALL) ALL
```

## Timeshift


```
# grep BACKUPS /etc/fstab
LABEL=BACKUPS	/backups	ext4	defaults	0 2
```

```
mkdir /backups
tune2fs -L BACKUPS /backups
mount /backups
```

Then launch **Timeshift** graphical application as normal user:

* RSYNC
* Keep 5 Daily snaphosts

Check configuration with:

```
sudo timeshift --list-devices
sudo timeshift --list-snapshots
```
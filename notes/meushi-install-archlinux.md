# meushi's Arch Linux installation (2021.02)

Reference: https://wiki.archlinux.org/index.php/Installation_guide

## BIOS

* Boot\CSM disabled
* Boot\Secure Boot set to Other OS

## Basic install

Boot on a USB key with Arch Linux ISO (not netinstall)

```loadkeys fr```

Create disk layout

Create filesystems

```
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
```

```
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
```

```
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt
```

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

```
pacman -Sy vim
```

In **/etc/locale.gen**, uncomment:

```
en_US.UTF-8
fr_FR.UTF-8
```

```
locale-gen
```

Create **/etc/vconsole.conf**

```
KEYMAP=fr
```

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

```
passwd
```

```
pacman -S grub efibootmgr dosfstools mtools amd-ucode
grub-install --target=x86_64-efi --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

```
exit
reboot
```

Login as **root**.

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
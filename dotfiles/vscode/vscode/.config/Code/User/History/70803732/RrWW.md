# XFCE Configuration


## Arch Linux

#### XFCE Packages

```bash
sudo pacman -S xfce4 xfce4-screenshooter xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-sensors-plugin xfce4-mount-plugin xfce4-notifyd
```

#### Audio

```bash
sudo pacman -S pipewire pipewire-pulse
```

#### Network

```bash
sudo pacman -S networkmanager network-manager-applet
sudo systemctl enable NetworkManager.service
```

#### Bluetooth

```bash
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable bluetooth.service
```

#### Utilities

```bash
sudo pacman -S xarchiver thunar-archive-plugin gvfs gvfs-mtp gvfs-gphoto2 gvfs-smb git wget curl htop neofetch xclip xsel feh gnome-keyring xorg-xkill pavucontrol rofi webp-pixbuf-loader ristretto mpv ffmpegthumbnailer tumbler tmux
```

#### Fonts

```bash
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```

#### Office

```bash
sudo pacman -S libreoffice-fresh libreoffice-fresh-id libreoffice-fresh-ja atril
```

#### WINE

```bash
# Add multilib repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu
sudo pacman -S wine winetricks
```


# XFCE Configuration

## Arch Linux

#### Necessary Packages

```bash
sudo pacman -S sudo base-devel
```

#### Display Server

```bash
sudo pacman -S lightdm lightdm-slick-greeter
sudo sed -i 's/^#greeter-session=example-gtk-gnome$/greeter-session=lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm.service
```

#### LXQT and i3 Packages

```bash
sudo pacman -S lxqt kvantum i3-wm picom polybar rofi breeze-icons oxygen-icons xsettingsd
```

#### Audio

```bash
sudo pacman -S pipewire pipewire-pulse pamixer pavucontrol
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
sudo pacman -S xarchiver gvfs gvfs-mtp gvfs-gphoto2 gvfs-smb git wget curl htop neofetch xclip xsel feh gnome-keyring xorg-xkill webp-pixbuf-loader mpv ffmpegthumbnailer tumbler tmux neovim kitty

sudo ln -s /usr/bin/nvim /usr/bin/vim
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

#### AUR Helper

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### Shell

```bash
paru -S zsh oh-my-zsh-git
echo "exec zsh" >> ~/.bashrc
```

#### Fonts

```bash
paru -S ttf-dejavu ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts-meta
```
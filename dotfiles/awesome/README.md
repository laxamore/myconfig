# Arch Linux with Awesome WM

## Arch Linux

#### Necessary Packages

```bash
sudo pacman -S sudo base-devel rustup go
rustup default stable
```

#### Display Server

```bash
sudo pacman -S lightdm lightdm-slick-greeter
sudo sed -i 's/^#greeter-session=example-gtk-gnome$/greeter-session=lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm.service
```

#### Awesome WM

```bash
sudo pacman -S awesome picom rofi breeze-icons oxygen-icons i3lock
```

#### Audio

```bash
sudo pacman -S pipewire pipewire-pulse pamixer pavucontrol wireplumber
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
sudo pacman -S xarchiver gvfs gvfs-mtp gvfs-gphoto2 gvfs-smb git wget curl htop neofetch xclip xsel feh gnome-keyring xorg-xkill webp-pixbuf-loader mpv ffmpegthumbnailer tmux neovim rofi-calc imagemagick kitty thunar thunar-archive-plugin tumbler go fd ripgrep arc-icon-theme rustup pacman-contrib flameshot xterm arandr nvm pyenv python-virtualenv ristretto stow

sudo ln -s /usr/bin/nvim /usr/bin/vim
```

##### Laptop Only

```bash
sudo pacman -S brightnessctl acpi 
```

#### GPU Drivers

##### NVIDIA

```bash
sudo pacman -S nvidia nvtop
```

#### Office

```bash
sudo pacman -S libreoffice-fresh libreoffice-fresh-id libreoffice-fresh-ja atril
```
#### Multimedia

```bash
sudo pacman -S krita gimp blender ardour yabridge yabridgectl
```

#### WINE

```bash
# Add multilib repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu
sudo pacman -S wine-staging winetricks
```

#### AUR Helper

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
#### Programming

```bash
paru -S jdk8-openjdk jdk11-openjdk jdk17-openjdk
sudo archlinux-java set java-8-openjdk

paru -S visual-studio-code-bin dbeaver stm32cubemx stm32cubeprog docker dotnet-runtime-6.0

usermod -aG docker laxa
```

#### Engineering

```bash
pacman -S kicad kicad-library kicad-library-3d
```

#### Shell

```bash
paru -S zsh oh-my-zsh-git
echo "exec zsh" >> ~/.bashrc
```

#### Fonts

```bash
paru -S ttf-dejavu ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts
```

#### Keyboard Input

```bash
paru -S fcitx5-mozc fcitx5-gtk fcitx5-qt fcitx5-material-color fcitx5-configtool
```

```bash
# Set environment variables
sudo tee -a /etc/environment <<EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
GLFW_IM_MODULE=ibus
EOF
```

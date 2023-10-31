# My XFCE4 Desktop Configuration

## Shortcuts

| Shortcut | Action |
| --- | --- |
| `Super + Q` | Reload XFCE4 Configuration |
| `Super + E` | Open Thunar |
| `Super + Space` | Run Rofi |
| `Super + C` | Run Rofi Calc |
| `Super + Shift + C` | Close Window |
| `Super + 1-9` | Switch to Workspace 1-9 |
| `` Super + ` `` | Switch to Next Workspace |
| `` Super + Shift + ` `` | Switch to Previous Workspace |
| `Super + Shift + 1-9` | Move Window to Workspace 1-9 |
| `Super + Left` | Tile Window Left |
| `Super + Right` | Tile Window Right |
| `Super + Up` | Tile Window Up |
| `Super + Down` | Tile Window Down |
| `Alt + F4` | Close Window |
| `Ctrl + Alt + T` | Open Terminal |

## Arch Linux

### Packages

#### Base

```bash
sudo pacman -S xfce4 xfce4-goodies
```

#### Display Manager

```bash
sudo pacman -S lightdm lightdm-slick-greeter
sudo sed -i 's/^#greeter-session=example-gtk-gnome$/greeter-session=lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm.service
```

#### Audio

```bash
sudo pacman -S pipewire pipewire-pulse pamixer pavucontrol wireplumber pipewire-jack carla
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
sudo pacman -S git wget curl htop neofetch xclip xsel gnome-keyring mpv tmux neovim rofi-calc go fd ripgrep stow

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

#### NodeJS NVM

```bash
paru -S nvm
nvm install --lts
```

#### Fonts

```bash
paru -S ttf-dejavu ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts-meta
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

### Installation

- Install Arch Linux as usual according to the [Arch Linux Installation Guide](https://wiki.archlinux.org/title/Installation_guide).
- Install packages above.
- Clone this repository.
- Run the `install_config.sh` script.
- Change the default shell to ZSH.

    ```bash
    chsh -s /bin/zsh
    ```

- Reboot.

## Ubuntu 22.04

With ubuntu install xubuntu version [here](https://xubuntu.org/download/)

### Additional Packages

```bash
sudo apt install -y git wget curl htop neofetch xclip xsel gnome-keyring mpv tmux neovim rofi go fd-find ripgrep stow zsh
```

### Installation

- Install Ubuntu as usual.
- Install packages above.
- Clone this repository.
- Run the `install_config.sh` script.
- Change the default shell to ZSH.

    ```bash
    chsh -s /bin/zsh
    ```

- Reboot.

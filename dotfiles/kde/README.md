# My KDE Plasma Desktop Configuration

## Arch Linux

### Packages

#### Plasma

```bash
sudo pacman -S plasma kmail dolphin kdeconnect kcalc kwalletmanager spectacle ark kdialog okular
```

#### Display Manager

```bash
sudo pacman -S sddm
```

#### Audio

```bash
sudo pacman -S pipewire pipewire-pulse wireplumber pipewire-jack carla
```

#### Network

```bash
sudo pacman -S networkmanager dnsmasq
```

#### Bluetooth

```bash
sudo pacman -S bluez bluez-utils
```

#### Utilities

```bash
sudo pacman -S git wget curl htop neofetch xclip xsel mpv tmux neovim go fd ripgrep stow openssh keepassxc nextcloud-client discord obs-studio unzip

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
sudo pacman -S wine-staging winetricks
```

### AUR Packages

In my config i use paru as AUR helper, and is it recommended to use paru without using sudo.


```bash
su - <username>
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### Shell

```bash
su - <username>
paru -S zsh oh-my-zsh-git
echo "exec zsh" >> ~/.bashrc
```

#### NodeJS NVM

```bash
su - <username>
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

#### AutoFS

```bash
paru -S autofs
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

### Initial Configuration

#### Display Manager

```bash
sudo systemctl enable sddm.service
```

#### Audio

```bash
sudo systemctl enable pipewire pipewire-pulse wireplumber
```

#### Network

```bash
sudo systemctl enable NetworkManager.service
```

#### Bluetooth

```bash
sudo systemctl enable bluetooth.service
```

#### AutoFS

```bash
# Create AutoFS Master Configuration
sudo tee -a /etc/autofs/auto.master <<EOF
/mnt/<Mount Point> /etc/autofs/auto.<Mount Point> --timeout=60
EOF

# Create AutoFS Mount Point
sudo mkdir /mnt/<Mount Point>

# Create AutoFS Configuration
sudo tee -a /etc/autofs/auto.<Mount Point> <<EOF
# NFS
<Mount Point> -fstype=nfs,rw,soft,intr,rsize=8192,wsize=8192 <NFS Server>:/<NFS Share>
EOF

# Enable AutoFS
sudo systemctl enable autofs.service
```

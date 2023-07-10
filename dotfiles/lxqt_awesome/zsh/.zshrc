# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#export ZSH="/home/laxa/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source /usr/share/oh-my-zsh/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




# My RC.
export TERM=xterm-256color

# sudo aliases
alias sudo="sudo "

# vim asliases to nvim
alias vim="nvim"

# cp aliases to rsync
# alias cp="rsync -azvP"

export PATH=~/.npm-global/bin:/usr/local/go/bin:~/go/bin:~/.local/bin:~/.local/vscode/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export HYBRIS_HOME_DIR=/home/laxa/.local/share/sap_hybris/AUTO2000
export ANT_HOME=${HYBRIS_HOME_DIR}/hybris/bin/platform/apache-ant
export JDTLS_HOME=${HOME}/.java/jdtls # Directory with the plugin and configs directories
export WORKSPACE=${HOME}/.config/coc/extensions/coc-java-data/jdt_ws_5f54a6a4fe7649bb6a52262c052a8f88

export PATH=${PATH}:${ANT_HOME}/bin:/home/laxa/Documents/repo/flutter/bin

alias cwd="cd $HYBRIS_HOME_DIR"
alias cdd="cd ~/repo/laxamore/myconfig/dotfiles"
alias crd="cd ~/repo"
alias cwrd="cd ~/repo/agit/dandelion"

# Aliases for SAP Commerce Dev

 
alias aar="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ant all && ./hybrisserver.sh -d"
alias aa="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ant all && cd -"
alias aca="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ant clean all && cd -"
alias acar="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ant clean all && ./hybrisserver.sh -d"
alias ard="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ant && ./hybrisserver.sh -d"
alias hrd="cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ./hybrisserver.sh -d"
alias thrd="tmux new-session -A -s hybris \"cd $HYBRIS_HOME_DIR/hybris/bin/platform && . ./setantenv.sh && ./hybrisserver.sh -d\""
alias fedbuild="~/Documents/repo/agit/dandelion/auto2000fedinstall.sh"

# Ripgrep search hidden by default
alias rg="rg --hidden"

export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# archlinux aur nvm
source /usr/share/nvm/init-nvm.sh

# End of My RC

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# SSL
export SSL_CERT_DIR=/etc/ssl/certs

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export ZEPHYR_BASE=/home/laxa/ZephyrSDK/zephyr

# Wine Prefix
export WINEPREFIX=~/.wine

# Vivado Xilinx
export PATH=/opt/Xilinx/Vivado/2022.1/bin:~/.cargo/bin/:$PATH

# Enable F4PGA Env
export F4PGA_INSTALL_DIR=/opt/f4pga
export FPGA_FAM=xc7
export F4PGA_PACKAGES="install-xc7 xc7a50t_test xc7a100t_test xc7a200t_test xc7z010_test"
alias enable_f4pga="source $F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh; conda activate $FPGA_FAM"

clear

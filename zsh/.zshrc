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

source ~/.oh-my-zsh/oh-my-zsh.sh

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





# doas aliases to sudo
#alias sudo="doas"
#alias sudoedit="doas nvim"

# vim asliases to nvim
alias vim="nvim"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=~/.npm-global/bin:~/go/bin:~/.local/bin:~/.local/vscode/bin:$PATH
export HYBRIS_HOME_DIR=/home/laxa/.local/share/sap_hybris/CXCOMM201100P_8-70005693
export ANT_HOME=${HYBRIS_HOME_DIR}/hybris/bin/platform/apache-ant
export JDTLS_HOME=${HOME}/.java/jdtls # Directory with the plugin and configs directories
export WORKSPACE=${HOME}/.config/coc/extensions/coc-java-data/jdt_ws_5f54a6a4fe7649bb6a52262c052a8f88

export PATH=${PATH}:${ANT_HOME}/bin:/home/laxa/Documents/repo/flutter/bin
export CHROME_EXECUTABLE=chromium

#if  [[ "$TMUX_PANE" != '' && "$(tmux display-message -p  '#{pane_index}')" == '0' ]]; then
#  vim
#fi

alias cwd="cd $HYBRIS_HOME_DIR"
alias cdd="cd ~/Documents/repo/laxamore/dotfiles"
alias crd="cd ~/Documents/repo"
alias cwrd="cd ~/Documents/repo/agit/dandelion"

# Aliases form SAP Commerce Developing
alias aar="ant all && ./hybrisserver.sh -d"
alias aa="ant all"
alias aca="ant clean all"
alias acar="ant clean all && ./hybrisserver.sh -d"
alias antr="ant && ./hybrisserver.sh -d"
alias fedbuild="~/Documents/repo/agit/dandelion/auto2000fedinstall.sh"

# Aliases for docker rocm pytorch
# alias rcmpdock="docker start rocm3.5.1_pytorch > /dev/null && docker exec -it rocm3.5.1_pytorch bash"

# Python Base Env
# source ~/.python_env/playground/bin/activate

# Pywal color sync
# wal -i ~/Pictures/Wallpapers -q -t -e

# Ripgrep search hidden by default
alias rg="rg --hidden"

source /usr/share/nvm/init-nvm.sh

export PYTHONPATH=$PYTHONPATH:/opt/ros/noetic/lib/python3.8/site-packages/:/opt/ros/noetic/lib/python3.9/site-packages/

## ROS
#source /opt/ros/noetic/setup.zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ys"
#ZSH_THEME="agnoster"
#ZSH_THEME="bullet-train"
ZSH_THEME="powerlevel9k/powerlevel9k"

# command line 左邊想顯示的內容
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs laravel_version) 
# command line 右邊想顯示的內容
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram load time) # <= right prompt 設了 "time"

# 使用 nerd font 時可以顯示更多 icon。詳情請參考 powerlevel9k wiki 
POWERLEVEL9K_MODE='nerdfont-complete'

# 若當前登入的帳號為你的帳號 xxx，就不用特別顯示出來
DEFAULT_USER="chingwei"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias ptt="ssh bbsu@ptt.cc"

alias tunnel='ssh -N -p 2222 -c 3des chingwei@localhost -L 1111/10.11.10.13/22 -L 5432/10.11.2.31/5432 -L 1122/10.1.1.4/22'
alias oss='ssh -P -Nf -p 22 -c 3des xuite@210.59.147.232 -L 2222/172.30.211.1/22'


alias gst='git status'
alias gd=' LESSCHARSET=utf-8 git diff'
alias gc='git commit'
alias gps='git push'
alias gpl='git pull'

alias dev='cd ~/PhpstormProjects/dev/'
alias skyeye='cd ~/PhpstormProjects/skyeye/'
alias skynet='cd ~/PhpstormProjects/skynet/'
alias vrs='cd ~/PhpstormProjects/vrs/'
alias typd='cd ~/PhpstormProjects/typd/'
alias route-home='/usr/bin/sudo route add -net 192.168.1 10.5.0.254'
alias pttimg="ssh bbsu@ptt.cc | ~/.bin/ptt-autopic"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

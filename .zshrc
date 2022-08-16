#user-defined functions
gtp(){
    git add .
    git commit -m "$*"
    git push
}

gtb () {
    [ -z "$*" ] && br=$(git branch -a | fzf --border=rounded --layout=reverse --height=10 | tr -d ' ') || br=$*
    [ -z "$br" ] || git checkout $br
    unset br
}

url() {
    curl -s https://0x0.st -F "file=@$*" | xclip -sel clip && notify-send "Link copied to clipboard"
}

gtd () {
    [ -z "$*" ] && file=$(git diff --name-only | fzf --border=rounded --height=10 --layout=reverse | tr -d ' ') || file=$*
    [ -z "$file" ] || git diff $file
    unset file
}

# Lines configured by zsh-newuser-install
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="lxterminal"
export OPENER="xdg-open"
export VIDEO="mpv"
export WM="bspwm"
export IMAGE="sxiv"
alias v="nvim -O"
alias anime="$HOME/lol/ani-cli"
alias cp="cp -v"
alias rm="rm -v"
alias grep="grep --color=auto"
alias ncdu="ncdu --color dark"
alias ll="ls --color=auto -alh"
alias ls="ls --color=auto"
alias ncbb="nvim ~/.config/bspwm/bspwmrc"
alias ncpc="nvim ~/.config/polybar/config"
alias ncss="nvim ~/.config/sxhkd/sxhkdrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg="#D5C4B8",underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg="#D5C4B8",underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg="#D5C4B8"

HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=200
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tanveer/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# End of lines added by compinstall

eval "$(starship init zsh)"

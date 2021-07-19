# Lines configured by zsh-newuser-install
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export OPENER="xdg-open"
export VIDEO="vlc"
export WM="bspwm"
export PAGER="less"
export IMAGE="sxiv"
alias neofetch="neofetch --ascii_distro Arch_small"
alias v="nvim"
alias refresh="sudo reflector --verbose --latest 10 --sort rate --age 12 --protocol http,https --save /etc/pacman.d/mirrorlist"
alias ll="ls --color=auto -alh"
alias ls="ls --color=auto -hl"
alias ncbb="nvim ~/.config/bspwm/bspwmrc"
alias ncpc="nvim ~/.config/polybar/config"
alias ncss="nvim ~/.config/sxhkd/sxhkdrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tanveer/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

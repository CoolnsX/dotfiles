#
# ~/.bashrc
#
 
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -alh'
alias refresh='sudo reflector --verbose --latest 10 --sort rate --protocol http,https --age 12 --save /etc/pacman.d/mirrorlist'
alias ncbb="nvim ~/.config/bspwm/bspwmrc"
alias ncss="nvim ~/.config/sxhkd/sxhkdrc"
alias ncpc="nvim ~/.config/polybar/config"
alias v="nvim"
alias r="ranger"
 
PS1="\n\[$(tput setaf 9)\]\u \[$(tput setaf 15)\]in \[$(tput setaf 190)\]\w \[$(tput setaf 166)\]\nβ \[$(tput setaf 81)\]";
trap 'echo -ne "$(tput sgr0)"' DEBUG
export PS2;

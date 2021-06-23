
alias v="nvim"
alias refresh="sudo reflector --verbose --latest 10 --sort rate --age 12 --protocol http,https --save /etc/pacman.d/mirrorlist"
alias ll="ls --color=auto -alh"
alias ls="ls --color=auto"
alias ncbb="nvim ~/.config/bspwm/bspwmrc"
alias ncpc="nvim ~/.config/polybar/config"
alias ncss="nvim ~/.config/sxhkd/sxhkdrc"

eval 
            __main() {
                local major="${BASH_VERSINFO[0]}"
                local minor="${BASH_VERSINFO[1]}"

                if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
                    source <("/usr/bin/starship" init bash --print-full-init)
                else
                    source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
                fi
            }
            __main
            unset -f __main
            

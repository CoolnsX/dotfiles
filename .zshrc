#user-defined functions
gtp(){
    [ -z "$*" ] && commit=$(curl -s "https://raw.githubusercontent.com/ngerakines/commitment/master/commit_messages.txt" | shuf -n1) || commit=$*
    git add .
    git commit -m "$commit"
    xclip -sel clip $HOME/token
    git push
    unset commit
}

gtb () {
    [ -z "$*" ] && br=$(git branch -a | fzf --border=rounded --layout=reverse --height=10 | tr -d ' ') || br=$*
    [ -z "$br" ] || git checkout $br
    unset br
}

url() { curl -s https://0x0.st -F "file=@$*" | xclip -sel clip && notify-send "Link copied to clipboard"; }

gtd () {
    [ -z "$*" ] && file=$(git diff --name-only | fzf --border=rounded --height=10 --layout=reverse | tr -d ' ') || file=$*
    [ -z "$file" ] || git diff $file
    unset file
}

gtc () { [ -z "$*" ] && [ -p "/dev/stdin" ] && read -r query </dev/stdin || query=$*; git clone "$query"; }

gitf () { [ -z "$*" ] && [ -p "/dev/stdin" ] && read -r query </dev/stdin || query=$*
    [ -z "$query" ] || curl -s "$(curl -s "$(printf "%s" "$query" | sed 's_github\.com_api\.github\.com/repos_g;s_$_/contents_g')" | sed -nE 's|.*download_url": "([^"]*)".*|\1|p' | fzf --border=rounded --height=10 --layout=reverse)" | bat
}

gtr () { [ -z "$*" ] && [ -p "/dev/stdin" ] && read -r query </dev/stdin || query=$*; [ -z "$query" ] || curl -s "https://api.github.com/users/$query/repos?per_page=100" | sed -nE 's|.*svn_url": "([^"]*)".*|\1|p' | fzf --border --height=10 --layout=reverse; }

gtu () { [ -z "$*" ] || curl -s "https://api.github.com/search/users?q=$*" | sed -nE 's_.*login": "([^"]*)".*_\1_p' | fzf --layout=reverse --border --height=10; }

clshist() {
    a=$(cat ~/.histfile | wc -l)
    [ "$a" -gt 201 ] && sed -i "1,$((a - 200))d" .histfile
}

# Lines configured by zsh-newuser-install
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export OPENER="xdg-open"
export VIDEO="mpv"
export WM="bspwm"
export IMAGE="nsxiv"
alias v="nvim -O"
alias anime="$HOME/lol/ani-cli"
alias cp="cp -v"
alias diff="diff --color -u"
alias rm="rm -v"
alias mv="mv -v"
alias grep="grep --color=auto"
alias ncdu="ncdu --color dark"
alias ll="ls --color=auto -alh"
alias ls="ls --color=auto"
alias fetch='/bin/*fetch'
alias ncbb="nvim ~/.config/bspwm/bspwmrc"
alias ncss="nvim ~/.config/sxhkd/sxhkdrc"

if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white
fi

clshist
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=200
setopt autocd
bindkey -e
zstyle :compinstall filename '/home/tanveer/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
eval "$(starship init zsh)"

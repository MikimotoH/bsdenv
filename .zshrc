## . /root/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh
################################################
#
#   ZSH Config
#
################################################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial zsh-syntax-highlighting zsh-history-substring-search)

# Customize to your needs...
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
source $ZSH/oh-my-zsh.sh

# Platform Check

platform="unknown"
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    platform="linux"
elif [[ "$unamestr" == "Darwin" ]]; then
    platform="mac"
elif [[ "$unamestr" == "FreeBSD" ]]; then
    platform="freebsd"
fi

if [[ $platform == "freebsd" ]]; then
    echo '===== Config FreeBSD Environment ====='
    echo 'Setup Clang CC and CXX to /usr/bin/clang and /usr/bin/clang++'
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
fi

#My Alias
alias cmsg="echo /dev/null > /var/log/messages"
alias vmsg="vim /var/log/messages"
alias tmsg="tail -f /var/log/messages"
alias l="ls -Fal"
alias etags='exctags -R --c-kinds=+p --c-types=+p --fields=+S  --links=no --sort=foldcase .'
alias hgst='hg status'
alias hgco='hg commit -m'
alias hgup='hg update '
alias hgpu='hg pull'
alias hgps='hg push'
alias hgdi='hg diff -bBw'
alias hgsg='hg sglog|head -33'
alias gitst='git status'
alias md='mkdir -p'

export TERM=xterm-256color
export PACKAGESITE=ftp://ftp6.tw.freebsd.org/pub/FreeBSD/ports/amd64/packages-9.1-release/Latest/
export EDITOR=/usr/local/bin/vim
setopt extendedglob
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Use VIM as man page viewer
# http://ebergen.net/wordpress/2009/06/04/using-vim-as-a-man-page-viewer/
export MANPAGER="col -b | vim -c 'set ft=man nomod nolist' -"


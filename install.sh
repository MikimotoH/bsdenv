#!/usr/bin/env zsh 
# pre-requirement:
#   oh-my-zsh, vim 7.3(+python ) and clang installed

setenv PACKAGESITE http://freebsd.ntu.edu.tw/FreeBSD/ports/amd64/packages-9.2-release/Latest/
export PACKAGESITE=http://freebsd.ntu.edu.tw/FreeBSD/ports/amd64/packages-9.2-release/Latest/
[[ -d ~/.oh-my-zsh ]] || \
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

pkg_add -r wget
pkg_add -r mercurial
pkg_add -r vim

if hash ack 2>/dev/null ; then
    echo "ack already installed"
else
    echo "Install ack"
    curl "http://beyondgrep.com/ack-2.04-single-file" > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
fi


cp ./rkj-repos.zsh-theme ~/.oh-my-zsh/themes

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "zsh-syntax-highlighting is already installed"
else
    echo "Install zsh-syntax-highlighting.git"
    (mkdir -p ~/.oh-my-zsh/custom/plugins; cd ~/.oh-my-zsh/custom/plugins; \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git; \
        git clone https://github.com/zsh-users/zsh-history-substring-search )
fi

(cd ~ && hg clone https://bitbucket.org/sjl/hg-prompt )
(cd ~ && hg clone https://bitbucket.org/sjl/mercurial-cli-templates)

ln -sf `readlink -f .gitconfig` ~/
ln -sf `readlink -f .vimrc` ~/
ln -sf `readlink -f .vim` ~/
ln -sf `readlink -f .zshrc` ~/
ln -sf `readlink -f .hgrc`  ~/

# Install VIM pathogen -- bundle manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl 'www.vim.org/scripts/download_script.php?src_id=19375' \
  > ~/.vim/autoload/pathogen.vim


if [ -f ~/.vim/colors/wombat256.vim ] ; then
    echo "wombat256.vim is already installed in vim/colors"
else 
    echo "Install wombat256 color for VIM"
    mkdir -p ~/.vim/colors && curl \
    'www.vim.org/scripts/download_script.php?src_id=13397' > ~/.vim/colors/wombat256.vim
fi

if [ -d ~/.vim/bundle/nerdtree ]; then
    echo "NERDTree is already installed."
else
    echo "Install NERDTree "
    (cd ~/.vim/bundle && \
        git clone https://github.com/scrooloose/nerdtree.git)
fi

if [ -d ~/.vim/bundle/tagbar ]; then
    echo "Tagbar is already installed."
else
    echo "Install Tagbar "
    (cd ~/.vim/bundle && \
        git clone git://github.com/majutsushi/tagbar)
fi

if [ -f ~/.vim/plugin/ack.vim ]; then
    echo "ack.vim is already installed"
else
    echo "Install ack.vim"
    ( cd ~/.vim && curl -Sso ack.tar.gz \
        "http://www.vim.org/scripts/download_script.php?src_id=10433" \
        && tar zxvf ack.tar.gz && rm ack.tar.gz )
fi


if [ -d ~/.vim/doc ] ; then
    if [ "$(ls -A ~/.vim/doc )" ]; then 
        print  "~/.vim/doc not empty" 
        vim -c "helptags ~/.vim/doc/" -c "q"
    else 
        print "~/.vim/doc is empty; don't helptags" 
    fi
else
    print "make empty ~/.vim/doc/"
    mkdir -p ~/.vim/doc
fi

[[ -d /usr/local/share/vim/vim74 ]] || ln -s /usr/local/share/vim/vim73 /usr/local/share/vim/vim74


vim -c "helptags ~/.vim/bundle/nerdtree/doc/" -c "helptags ~/.vim/bundle/tagbar/doc/" -c q


#!/usr/bin/env zsh 
# pre-requirement:
#   oh-my-zsh, vim 7.3(+python ) and clang installed

if [ -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    echo "zsh-syntax-highlighting is already installed"
else
    echo "Install zsh-syntax-highlighting.git and zsh-history-substring-search.git"; \
    (mkdir -p ~/.oh-my-zsh/custom/plugins; cd ~/.oh-my-zsh/custom/plugins; \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git; \
        git clone https://github.com/zsh-users/zsh-history-substring-search.git )
fi

ln -sf `readlink -f .zshrc` ~/
ln -sf `readlink -f .vimrc` ~/
ln -sf `readlink -f .hgrc`  ~/
ln -sf `readlink -f .gitconfig` ~/
ln -sf `readlink -f .vim` ~/
ln -sf `readlink -f hg-prompt` ~/


if [ -f ~/.vim/autoload/pathogen.vim ]; then
    echo "pathogen.vim is already installed"
else
    echo "Install pathogen for vim"
    (cd ~/.vim; mkdir -p autoload; mkdir -p bundle; curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim)
fi

if [ -f ~/.vim/colors/wombat256.vim ] ; then
    echo "wombat256.vim is already installed in vim/colors"
else 
    echo "Install wombat256 color for VIM"
    (mkdir -p ~/.vim/colors; cd ~/.vim/colors; curl -Sso wombat256.vim \
        http://www.vim.org/scripts/download_script.php\?src_id\=13397)
fi

if [ -d ~/.vim/bundle/nerdtree ]; then
    echo "NERDTree is already installed."
else
    echo "Install NERDTree "
    (cd ~/.vim/bundle; \
        git clone https://github.com/scrooloose/nerdtree.git)
fi

if [ -d ~/.vim/bundle/tagbar ]; then
    echo "Tagbar is already installed."
else
    echo "Install Tagbar "
    (cd ~/.vim/bundle; \
        git clone git://github.com/majutsushi/tagbar)
fi

if [ -f ~/.vim/plugin/ack.vim ]; then
    echo "ack.vim is already installed"
else
    echo "Install ack.vim"
    ( cd ~/.vim; curl -Sso ack.tar.gz \
        "http://www.vim.org/scripts/download_script.php?src_id=10433";\
        tar zxvf ack.tar.gz; rm ack.tar.gz )
fi

if [ -f ~/.vim/plugin/TTrCodeAssistor.vim ] ; then
    echo "TTrCodeAssistor.vim is already installed"
else
    echo "Install TTrCodeAssistor.vim"
    mkdir -p ~/.vim/plugin
    curl -Sso ~/.vim/plugin/TTrCodeAssistor.vim "http://www.vim.org/scripts/download_script.php?src_id=7265"
fi

if [ -f ~/.vim/plugin/acp.vim ] ; then
    echo "acp.vim(autocomplpop) is already installed"
else
    echo "Install acp.vim(autocomplpop)"
    (cd ~/.vim; curl -Sso acp.zip \
        "http://www.vim.org/scripts/download_script.php?src_id=11894"; \
        tar zxvf acp.zip; \
       rm acp.zip )
fi

if [ -d ~/.vim/doc ] ; then
    if [ "$(ls -A ~/.vim/doc )" ]; then 
        print  "~/.vim/doc not empty" 
        vim -c "helptags ~/.vim/doc/" -c q
    else 
        print "~/.vim/doc is empty; don't helptags" 
    fi
else
    print "make empty ~/.vim/doc/"
    mkdir -p ~/.vim/doc
fi

vim -c "helptags ~/.vim/bundle/nerdtree/doc/" -c "helptags ~/.vim/bundle/tagbar/doc/" -c q

if [ -d python-Levenshtein ] ; then
    echo "Levenshtein is already installed, which is required by Schmallon/clang_complete"
else
    echo "install python-Levenshtein, which is required by Schmallon/clang_complete "
    git clone https://github.com/miohtama/python-Levenshtein.git
    (cd python-Levenshtein; python ./setup.py install)
    ln -sf `readlink -f python-Levenshtein` ~/
fi

if [ -d ~/.vim/bundle/clang_complete ] ; then
    echo "clang_complete already installed in VIM"
else
    echo "Install clang_complete"
    (cd ~/.vim/bundle; git clone https://github.com/Schmallon/clang_complete.git; \
        cd clang_complete; make; \
        vim clang_complete.vmb.vba -c 'so %' -c q )
fi

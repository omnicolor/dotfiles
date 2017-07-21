#!/bin/bash
if [ -e ~/.bash_profile ]
then
    mv ~/.bash_profile ~/.bash_profile.bak
fi
ln -s `pwd`/bash_profile ~/.bash_profile
source ~/.bash_profile
if [ -e ~/.bash_prompt ]
then
    mv ~/.bash_prompt ~/.bash_prompt.bak
fi
ln -s `pwd`/bash_prompt ~/.bash_prompt
source ~/.bash_prompt
if [ -e ~/.gitconfig ]
then
    mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -s `pwd`/gitconfig ~/.gitconfig
if [ -e ~/.inputrc ]
then
    mv ~/.inputrc ~/.inputrc.bak
fi
ln -s `pwd`/inputrc ~/.inputrc
if [ -e ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s `pwd`/vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -so ~/.vim/colors/wombat.vim http://www.vim.org/scripts/download_script.php?src_id=6657
curl -so ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

if [ -x "$(command -v git)" ]; then
    git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
    git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
    git clone git://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
else
    curl -Lso ~/.vim/bundle/vim-colors-solarized.zip https://github.com/altercation/vim-colors-solarized/archive/master.zip
    curl -Lso ~/.vim/bundle/syntastic.zip https://github.com/vim-syntastic/syntastic/archive/master.zip
    unzip ~/.vim/bundle/vim-colors-solarized.zip -d ~/.vim/bundle
    unzip ~/.vim/bundle/syntastic.zip -d ~/.vim/bundle
fi

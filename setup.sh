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

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/pack/tpope/start
curl -Lso ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -Lso ~/.vim/colors/wombat.vim https://www.vim.org/scripts/download_script.php?src_id=6657
curl -Lso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
git clone git@github.com:tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git@github.com/tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim
git clone git@github.com:tpope/vim-commentary.git ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start && vim -u NONE -c "helptags commentary/doc" -c q && cd -
git clone git@github.com:tpope/vim-surround.git ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start && vim -u NONE -c "helptags surround/doc" -c q && cd -

git clone git@github.com:dense-analysis/ale ~/.vim/bundle/ale
cp -r ftplugins ~/.vim/

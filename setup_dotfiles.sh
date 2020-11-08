#!/bin/bash

echo -e "Installing John Reeve's dotfiles!!"
echo -e "Available at: https://github.com/reevejn/dotfiles\n"

dir="$( cd "$(dirname "$0")" ; pwd -P )"

echo -e "Installation occuring from:" $dir

cd $dir 
echo -e "Pulling from Git repo"
git pull
cd -

# Install Packages
./install_package.sh


echo -e "\n--> Moving all exiting dotfiles to *.old"
mv ~/.bashrc ~/.bashrc.old > /dev/null
#mv ~/.zshrc ~/.zshrc.old > /dev/null
mv ~/.vimrc ~/.vimrc.old > /dev/null
mv ~/.vimextras ~/.vimextras.old > /dev/null
mv ~/.tmux.conf ~/.tmux.conf.old > /dev/null
#mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.old > /dev/null
#mv ~/.config/zathura/zathurarc ~/.config/zathura/zathurarc.old > /dev/null
mv ~/.bash_aliases ~/.bash_aliases.old > /dev/null

echo -e "\n--> Linking dotfiles to repository "
ln -s $dir/.bashrc ~/.bashrc 
ln -s $dir/.bash_aliases ~/.bash_aliases
#ln -s $dir/.zshrc ~/.zshrc 
ln -s $dir/.vimrc ~/.vimrc 
#ln -s $dir/.vimextras ~/.vimextras 
ln -s $dir/.tmux.conf ~/.tmux.conf 
#ln -s $dir/rc.conf ~/.config/ranger/rc.conf
#ln -s $dir/zathurarc ~/.config/zathura/zathurarc

# Installing  Vundle (Vim plugin manager)
VUNDLE=~/.vim/bundle/Vundle.vim
if [ -d "$VUNDLE" ]; then 
	echo -e "--> Vundle Already Installed, Skipping..."
else 
	echo -e "  --> Installing Vundle (vim plugin manager)\n"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | sed "s/^/ /g"
fi

# Installing TPM (TMUX plugin manager)
TPM=~/.tmux/plugins/tpm
if [ -d "$TPM" ]; then
    echo -e "--> TPM already installed. Skiping..."
else 
    echo -e "  --> Installing TPM (TMUX plugin manager)\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm | sed "s/^/  /g"
fi
echo -e "--> Reloading Tmux"
tmux source ~/.tmux.conf


echo -e "--> Installing Plugins\n"
source $dir/update.sh


echo -e "\nDone"

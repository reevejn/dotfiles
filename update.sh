#! /bin/bash
echo -e "--> Pulling git repo"
cd $dir 
git pull
cd -

#Vim install and update plugins
echo -e "\n--. Installing and updating vim plugins\n"
vim +PluginINstall! +qall


Tmux install and update plugins 
echo -e "\n--> INstalling and updating tmux plugins \n"
~/.tmux/plugins/tpm/scrips/install_plugins.sh

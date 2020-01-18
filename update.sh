#! /bin/bash
echo -e "  --> Pulling git repo"
cd $dir 
git pull
cd -

# Vim install and update plugins
echo -e "  --. Installing and updating vim plugins\n"
vim +PluginINstall! +qall


# Tmux install and update plugins 
echo -e "  --> Installing and updating tmux plugins \n"
~/.tmux/plugins/tpm/scripts/install_plugins.sh

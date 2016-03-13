#!/bin/bash
############################
# .make.sh
# This script creates symlinks for configfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move existing config files to configfiles_old directory, then create symlinks from their directory to the ~/configfiles directory specified
echo "Moving existing gtk.css from gtk-3.0 to $olddir"
mv ~/.config/gtk-3.0/gtk.css $olddir/
echo "Creating symlink to gtk.css in gtk-3.0 directory."
ln -s $dir/gtk.css ~/.config/gtk-3.0/gtk.css


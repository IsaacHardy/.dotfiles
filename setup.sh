#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

#  Variables
dir=~/.dotfiles
templates=$dir/templates
extras=$dir/extras
olddir=~/.dotfiles_old
files="gitconfig zshrc spacemacs zpreztorc gitignore_global npmrc vimrc"

# create dotfiles_old in homedir
echo "\n1. Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "\n2. Changing to the $templates directory"
cd $templates

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "\n3. Moving existing dotfiles from ~ to $olddir \n"
for file in $files; do
    mv ~/.$file $olddir/
    ln -s $templates/$file ~/.$file
done

# move over VIM Snippets - using UltiSnips
echo "\n4. Moving over Vim Snippets \n"
rm -rf ~/.vim/snippets
mkdir ~/.vim/snippets
mkdir ~/.vim/snippets/UltiSnips
cp -R $dir/vim-snippets/ ~/.vim/snippets/UltiSnips

# Copy over Sublime Text 3 Settings
echo "\n5. Copying Over Atom Info"
ln -sf $extras/config.cson ~/.atom
ln -sf $extras/keymap.cson ~/.atom
ln -sf $extras/package.cson ~/.atom
ln -sf $extras/snippets.cson ~/.atom
ln -sf $extras/styles.less ~/.atom
ln -sf $extras/init.coffee ~/.atom

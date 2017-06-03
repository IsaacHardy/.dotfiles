#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

#  Variables
dir=~/.dotfiles
templates=$dir/templates
atom=$dir/atom
scripts=$dir/scripts
olddir=~/.dotfiles_old
files="gitconfig zshrc zpreztorc gitignore_global npmrc"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Install Homebrew
echo "${GREEN}>>>>> Installing Home Brew${NC}"
sh ./scripts/homebrew.sh

# Install Applications with Homebrew
echo "${GREEN}>>>>> brew bundle${NC}"
brew bundle

# create dotfiles_old in homedir
echo "${GREEN}>>>>> Creating $olddir for backup of any existing dotfiles in ~${NC}"
mkdir -p $olddir

# change to the dotfiles directory
echo "${GREEN}>>>>> Changing to the $templates directory${NC}"
cd $templates

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "${GREEN}>>>>> Moving existing dotfiles from ~ to $olddir \n${NC}"
for file in $files; do
    mv ~/.$file $olddir/
    ln -s $templates/$file ~/.$file
done

echo "${GREEN}>>>>> Heading back to .dotfiles directory${NC}"
cd ..

# Copy over Atom Information
echo "${GREEN}>>>>> Copying Over Atom Info${NC}"
ln -sf $atom/config.cson ~/.atom
ln -sf $atom/keymap.cson ~/.atom
ln -sf $atom/package.cson ~/.atom
ln -sf $atom/snippets.cson ~/.atom
ln -sf $atom/styles.less ~/.atom
ln -sf $atom/init.coffee ~/.atom

# Create Packages.txt File (This will save your current Package list)
# echo "> Creating Packages.txt file"
# sh $scripts/atom-package-backup.sh

# Install Atom packages
echo "${GREEN}>>>>> Install Atom Packages${NC}"
sh $scripts/atom-package-install.sh

# Install prezto
echo "${GREEN}>>>>> Configuring Prezto${NC}"
sh $scripts/prezto.sh

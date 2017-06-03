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
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Install Homebrew
echo "${YELLOW}>>>>> Installing Home Brew${NC}"
sh ./scripts/homebrew.sh
echo "${GREEN}>>>>> Finished - Installing Home Brew${NC}"

# Install Applications with Homebrew
echo "${YELLOW}>>>>> Starting Brew Bundle${NC}"
brew bundle
echo "${GREEN}>>>>> Finished - Brew Bundle${NC}"

# Add Applications to Dock
echo "${YELLOW}>>>>> Adding Applications to Dock${NC}"
sh $scripts/dock.sh
echo "${GREEN}>>>>> Finished - Adding Applications to Dock${NC}"

# Install prezto
# echo "${YELLOW}>>>>> Configuring Prezto${NC}"
# sh $scripts/prezto.sh

# create dotfiles_old in homedir
echo "${CYAN}>>>>> Creating $olddir for backup of any existing dotfiles in ~${NC}"
mkdir -p $olddir

# change to the dotfiles directory
echo "${CYAN}>>>>> Changing to the $templates directory${NC}"
cd $templates


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "${YELLOW}>>>>> Moving existing dotfiles from ~ to $olddir \n${NC}"
for file in $files; do
    mv ~/.$file $olddir/
    ln -s $templates/$file ~/.$file
done

echo "${GREEN}>>>>> Finished - Moving existing dotfiles from ~ to $olddir \n${NC}"

echo "${CYAN}>>>>> Heading back to .dotfiles directory${NC}"
cd ..



# Copy over Atom Information
echo "${YELLOW}>>>>> Linking Atom configuration files${NC}"
ln -sf $atom/config.cson ~/.atom
ln -sf $atom/keymap.cson ~/.atom
ln -sf $atom/package.cson ~/.atom
ln -sf $atom/snippets.cson ~/.atom
ln -sf $atom/styles.less ~/.atom
ln -sf $atom/init.coffee ~/.atom

echo "${GREEN}>>>>> Finished - Linking Atom configuration files${NC}"

# Create Packages.txt File (This will save your current Atom Package list)
# echo "${YELLOW}>>>>> Creating Packages.txt file${NC}"
# sh $scripts/atom-package-backup.sh
# echo "${GREEN}>>>>> Finished - Creating Packages.txt file${NC}"

# Install Atom packages
echo "${YELLOW}>>>>> Installing Atom Packages${NC}"
sh $scripts/atom-package-install.sh
echo "${GREEN}>>>>> Finished - Installing Atom Packages${NC}"

echo "${YELLOW}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${NC}"
echo "${YELLOW}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${NC}"
echo "${GREEN}>>>>> INSTALLATION COMPLETE <<<<<${NC}"
echo "${CYAN}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${NC}"
echo "${CYAN}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${NC}"

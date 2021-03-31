#! /bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################
set -e

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
sh $scripts/homebrew.sh
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
echo "${YELLOW}>>>>> Configuring Prezto${NC}"
zsh $scripts/prezto.sh
echo "${GREEN}>>>>> Finished - Configuring Prezto${NC}"

# create dotfiles_old in homedir
echo "${CYAN}>>>>> Creating $olddir for backup of any existing dotfiles in ~${NC}"
mkdir -p $olddir

# change to the dotfiles directory
echo "${CYAN}>>>>> Changing to the $templates directory${NC}"
cd $templates

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "${YELLOW}>>>>> Moving existing dotfiles from ~ to $olddir \n${NC}"
for file in $files; do
    set -e
    ln -sf $templates/$file ~/.$file
done
echo "${GREEN}>>>>> Finished - Moving existing dotfiles from ~ to $olddir \n${NC}"

# change back to .dotfiles directory
echo "${CYAN}>>>>> Heading back to .dotfiles directory${NC}"
cd ..

echo ""
echo ""
echo "${GREEN}I${CYAN}n${YELLOW}s${GREEN}t${CYAN}a${YELLOW}l${GREEN}l${CYAN}a${YELLOW}t${GREEN}i${CYAN}o${YELLOW}n ${GREEN}C${CYAN}o${YELLOW}m${GREEN}p${CYAN}l${YELLOW}e${GREEN}t${CYAN}e${YELLOW}!"

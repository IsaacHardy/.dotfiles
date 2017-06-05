#! /bin/bash
#
# usage: prezto
#
# This script installs prezto for easy Zsh config.

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Remove Old .z* Files
echo "${YELLOW}>>>>> Removing old .z* files${NC}"
arr=(${ZDOTDIR:-$HOME}/.z*)
for file in ${arr[@]}
do
  rm -rf $file
done
echo "${GREEN}>>>>> Finished - Removing old .z* files${NC}"

# Clone Prezto
echo "${YELLOW}>>>>> Cloning Prezto Repository${NC}"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo "${GREEN}>>>>> Finished - Cloning Prezto Repositiory${NC}"

# Create a new Zsh configuration
echo "${YELLOW}>>>>> Creating Zsh Configuration${NC}"
shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/!(README.md); do
  ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
done
echo "${GREEN}>>>>> Finished - Creating Zsh Configuration${NC}"

# Make Zsh default
echo "${YELLOW}>>>>> Making Zsh Default Shell${NC}"
chsh -s /bin/zsh
echo "${GREEN}>>>>> Finished - Making Zsh Default Shell${NC}"

exit 0

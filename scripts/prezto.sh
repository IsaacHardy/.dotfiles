#!/bin/zsh
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

# Remove old .zprezto file
echo "${YELLOW}>>>>> Removing old .zprezto directory${NC}"
rm -rf ${ZDOTDIR:-$HOME}/.zprezto
echo "${CYAN}>>>>> Removing old .zprezto directory = Success${NC}"

# Clone Prezto
echo "${YELLOW}>>>>> Cloning Prezto Repository${NC}"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo "${CYAN}>>>>> Cloning Prezto Repositiory = Success${NC}"

# Create a new Zsh configuration
echo "${YELLOW}>>>>> Creating Zsh Configuration${NC}"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s -f "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "${CYAN}>>>>> Creating Zsh Configuration = Success${NC}"

# Make Zsh default
echo "${YELLOW}>>>>> Making Zsh Default Shell${NC}"
chsh -s /bin/zsh
echo "${CYAN}>>>>> Making Zsh Default Shell = Success${NC}"

exit 0

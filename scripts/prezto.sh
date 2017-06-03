#!/bin/sh
#
# usage: prezto
#
# This script installs prezto for easy Zsh config.

# Launch Zsh
zsh

# Clone Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create a new Zsh configuration
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Make Zsh default
chsh -s /bin/zsh

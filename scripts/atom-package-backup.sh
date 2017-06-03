#!/bin/sh
#
# Usage: atom-package-backup
#
# Saves a list of your currently installed atom packages to
# ~/.dotfiles/extras/packages.txt suitable for install
# via atom-package-install

set -e

apm list --installed --bare > ~/.dotfiles/extras/packages.txt

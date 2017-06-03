#!/bin/sh
#
# Usage: atom-package-backup
#
# Saves a list of your currently installed atom packages to
# ~/.dotfiles/extras/packages.txt suitable for install
# via atom-package-install

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

set -e

apm list --installed --bare > ~/.dotfiles/atom/packages.txt

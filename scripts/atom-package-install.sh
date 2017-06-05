#! /bin/bash
#
# Usage: atom-package-install
#
# Installs the atom packages listed in your packages.txt file
# located at ~/.dotfiles/extras/packages.txt
#
# You can generate a new list based on currently installed
# packages via atom-package-backup

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

set -e

apm install --packages-file ~/.dotfiles/atom/packages.txt

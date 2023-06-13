#! /bin/bash

# (C) 2023 Mike Pratt <https://mikepratt.dev>

# See https://github.com/ohmyzsh/ohmyzsh#readme for more info on installation

core_apps=(
    'neovim'
    'zsh'
    'wget'
)

# Colours
GREY='\033[33;36m'
RED='\033[33;31m'
GREEN='\033[33;32m'
YELLOW='\033[33;33m'
BLUE='\033[33;34m'
RESET='\033[0m'

# skip user prompt after 10 seconds if they don't respond.
PROMPT_TIMEOUT=10

install_tool () {
    app=$1  
    echo -e "${BLUE} Would you like to install '${app}'? (Without '${app}' this script will exit) (y/N)${RESET}"
    read -t $PROMPT_TIMEOUT -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE} Installing ${app}...${RESET}"
        sudo pacman -S --needed --noconfirm $app
    else
        echo -e "${RED} Cannot proceed without ${app} installed, exiting...${RESET}"
        exit 1
    fi
}

echo -e "${BLUE}This script will setup zsh and install oh-my-zsh, and then use the existing zshrc config file.${RESET}"
echo -e "${YELLOW} Note that several packages are required for this script to work, if you do not"
echo -e "have them installed, you'll be prompted to install each one shortly.${RESET}"

# Check if running as root, if not then ask for password to proceed.
if [ "$EUID" -ne 0 ]; then
    echo -e "${BLUE} Enter your password (root).${RESET}"
    sudo -v
    if [ $? -eq 1 ]; then
        echo -e "${RED}Not running as root, cannot proceed, exiting script now...${RESET}"
        exit 1
    fi
fi

# Check if core deps are installed
for app in "${core_apps[@]}"; do
    if ! hash "${app}" 2> /dev/null; then
        install_tool $app
    else
        echo -e "${YELLOW} app ${app} is already installed, skipping.${RESET}"
    fi
done

# Change the default shell
echo -e "${BLUE}Changing the shell to 'zsh' ${YELLOW}(note you'll have to logout and in again once "
echo -e "this script has finished to see the changes)${RESET}."

chsh -s /bin/zsh # TODO: test this works

# Fetch oh-my-zsh
echo -e "${BLUE} Fetching oh-my-zsh...${RESET}"
wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
echo -e "${GREEN} Oh-my-zsh has been installed.${RESET}"
# TODO: Copy the .zshrc from ../zsh/ to $HOME
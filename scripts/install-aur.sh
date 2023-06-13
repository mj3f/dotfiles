#! /bin/bash

# (C) 2023 Mike Pratt <https://mikepratt.dev>

# See https://github.com/Jguer/yay#readme for more info on installation

# Cannot install yay without the following packages as per the yay docs.
core_apps=(
    'git'
    'base-devel'
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

echo -e "${BLUE}This script will setup yay for accessing the AUR (Arch user repository).${RESET}"
echo -e "${YELLOW} Note that git is required for this script to work, if you do not"
echo -e "have it installed, you'll be prompted to install it shortly.${RESET}"

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

# Fetch the yay git repo
echo -e "${BLUE} cloning the yay git repository...${RESET}"
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo -e "${GREEN} AUR helper yay has been installed in your $HOME directory.${RESET}"
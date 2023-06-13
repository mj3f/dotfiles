#! /bin/bash

# (C) 2023 Mike Pratt <https://mikepratt.dev>

# Apps to be installed
aur_apps=(
    'visual-studio-code-bin'
    'jetbrains-toolbox',
    'postman-bin' 
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

echo -e "${BLUE}Starting AUR apps install script..."
echo -e "${GREY}This script will install/upgrade packages from the AUR"
echo -e "${YELLOW}Make sure you read and understand the apps that are about to be installed!"
echo -e "if you already have some of the apps that are to be installed, it should just update them."
echo -e "${YELLOW}**BEWARE that with this script, when running yay commands"
echo -e "it will skip performing package checks, so only run this script if you're confident"
echo -e "of the apps being installed/updated. I'm not responsible if something goes wrong! **${RESET}"

# Check if running as root, if not then ask for password to proceed.
if [ "$EUID" -ne 0 ]; then
    echo -e "${BLUE} Enter your password (root).${RESET}"
    sudo -v
    if [ $? -eq 1 ]; then
        echo -e "${RED}Not running as root, cannot proceed, exiting script now...${RESET}"
        exit 1
    fi
fi

# Check pacman is installed
if ! hash yay 2> /dev/null; then
    echo -e "${RED}yay is not installed on your system, Run the 'install-aur.sh' script first. Exiting...${RESET}"
    exit 1
fi

# Ask user if they wish to update existing packages first
echo -e "${BLUE}Would you like to update existing packages first? (y/N)${RESET}"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Updating packages...${RESET}"
    yay -Syu --noconfirm
    echo -e "${GREEN} Updates complete.${RESET}"
fi

echo -e "${BLUE}Would you like to install the apps? (y/N)${RESET}"
read -t $PROMPT_TIMEOUT -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Commencing installation...${RESET}"
    for app in "${aur_apps[@]}"; do
        if hash "${app}" 2> /dev/null; then
            echo -e "${YELLOW} ${app} is already installed, skipping...${RESET}"
        else
            echo -e "${BLUE}Installing ${app}...${RESET}"
            yay -S ${app} --needed --noconfirm
        fi
    done
fi 

echo -e "${GREEN} Finished installing AUR Apps.${RESET}"
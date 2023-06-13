#! /bin/bash

# Apps to be installed
pacman_apps=(
    # The bare necessities
    'git'           # Version control
    'zsh'           # A shell that doesn't suck
    'neovim'        # Text editor that doesn't suck
    'wget'          # Download files
    'tmux'          # Terminal multiplexer

    # CLI Tools
    'jq'            # JSON parser, output and query files
    'tokei'         # Count lines of code
    'tree'          # Directory listings in a tree structure
    'ripgrep'       # Better grep
    'thefuck'       # auto-correct your butterfingers
    'scrot'         # terminal screenshots

    # Dev stuff (sdks, compilers, etc.)
    'dotnet-sdk'    # Corpo language that pays the bills
    'nodejs'        # Soy soy
    'npm'           # Soy soy that's a security nightmare
    'pnpm'          # Soy soy that's fast
    'python'        # l33t h4x0r language
    'python-pip'    # script kiddies number 1 tool?

    # Security
    'clamav'        # Anti virus
    'gnupg'         # PGP encryption
    'openssl'       # SSL/TLS

    # neofetch, obviously
    'neofetch'
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

echo -e "${BLUE}Starting install script for Arch..."
echo -e "${GREY}This script will install/upgrade packages,"
echo -e "and then install a collection of frequently used apps"
echo -e "${YELLOW}This script assumes you have just installed Arch linux"
echo -e "if you already have some of the apps that are to be installed, it should just update them."
echo -e "${RESET}"

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
if ! hash pacman 2> /dev/null; then
    echo -e "${RED}Pacman is not installed on your system, Exiting...${RESET}"
    exit 1
fi

# Ask user if they wish to update existing packages first
echo -e "${BLUE}Would you like to update existing packages first? (y/N)${RESET}"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Updating packages...${RESET}"
    sudo pacman -Syy --noconfirm
    sudo pacman -Syu --noconfirm
    echo -e "${GREEN} Updates complete.${RESET}"
fi

# Ask user if they want to clean up package cache.
echo -e "${BLUE} Would you like to clear the package cache? (y/N)${RESET}"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Clearing package cache...${RESET}"
    sudo pacman -Sc --noconfirm
    if ! hash paccache 2> /dev/null; then
        echo -e "${YELLOW}paccache (via pacman-contrib package) is not installed on your system, would you like to install it? (y/N)${RESET}"
        read -t $PROMPT_TIMEOUT -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo pacman -S pacman-contrib
            paccache -r
        fi
    fi
fi

echo -e "${BLUE}Would you like to install the apps? (y/N)${RESET}"
read -t $PROMPT_TIMEOUT -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Commencing installation...${RESET}"
    for app in "${pacman_apps[@]}"; do
        if hash "${app}" 2> /dev/null; then
            echo -e "${YELLOW} ${app} is already installed, skipping...${RESET}"
        elif [[ $(echo $(pacman -Qk $(echo $app | tr 'A-Z' 'a-z') 2> /dev/null )) == *"total files"* ]]; then
            echo -e "${YELLOW}${app} is already installed via Pacman, skipping...${RESET}"
        elif hash flatpak 2> /dev/null && [[ ! -z $(echo $(flatpak list --columns=ref | grep $app)) ]]; then
            echo -e "${YELLOW}${app} is already installed via Flatpak, skipping...${RESET}"
        else
            echo -e "${BLUE}Installing ${app}...${RESET}"
            sudo pacman -S ${app} --needed --noconfirm
        fi
    done
fi 

echo -e "${GREEN} Finished installing Apps.${RESET}"
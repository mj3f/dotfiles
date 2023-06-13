#! /bin/bash

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
echo -e "${YELLOW}This script assumes you have installed Arch linux, and have git installed."
echo -e "if you don't have git installed, install it."
echo -e "${RESET}"

# Check if running as root, if not then ask for password to proceed.
if [ "$EUID" -ne 0 ]; then
    echo -e "${BLUE} Enter your password (root)."
    sudo -v
    if [ $? -eq 1 ]; then
        echo -e "${RED}Not running as root, cannot proceed, exiting script now..."
        exit 1
    fi
fi

# Check pacman is installed
if ! hash pacman 2> /dev/null; then
    echo -e "${RED}Pacman is not installed on your system, Exiting...${RESET}"
    exit 1
fi

# Ask user if they wish to update existing packages first
echo -e "${BLUE}Would you like to update existing packages first? (y/N)"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Updating packages..."
    sudo pacman -Syy --noconfirm
    sudo pacman -Syu --noconfirm
    echo -e "${GREEN} Updates complete"
fi

# Ask user if they want to clean up package cache.
echo -e "${BLUE} Would you like to clear the package cache? (y/N)"
read -t $PROMPT_TIMEOUT -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Clearing package cache..."
    sudo pacman -Sc --noconfirm
    if ! hash paccache 2> /dev/null; then
        echo -e "${YELLOW}paccache (via pacman-contrib package) is not installed on your system, would you like to install it? (y/N)"
        read -t $PROMPT_TIMEOUT -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo pacman -S pacman-contrib
            paccache -r
        fi
    fi
fi

echo -e "${GREEN} Finished installing Apps.${RESET}"

the install script found in the scripts section doesn't work properly, so follow these steps instead:

- Run the following curl command: 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

- Edit the ~/.zshrc file, change the theme to whatever you want, and at the bottom make sure that `alias vim=nvim` is set.

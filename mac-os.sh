#!/bin/bash

# Define Git variables here.
GIT_EMAIL=""
GIT_USERNAME=""

# Check if Git variables have been defined. Exit script if not.
[[ -z "$GIT_EMAIL" ]] && { echo "Error: GIT_EMAIL variable is empty. Exiting script." ; exit 1; }
[[ -z "$GIT_USERNAME" ]] && { echo "Error: GIT_USERNAME variable is empty. Exiting script." ; exit 1; }

# Install common programs.
install_programs() {
    echo ">>> [Install programs] Started..."

    echo ">>> [Install programs] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo ">>> [Install programs] Homebrew install complete."

    echo ">>> [Install programs] Installing apps with brew..."
    brew install pass pass-otp tmux cmus neovim nodejs youtube-dl zsh
    brew install --cask hyper
    echo ">>> [Install programs] Install brew apps completed."

    echo ">>> [Install programs] Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    # Load NVM.
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install latest node version.
    nvm install node

    # Configure ZSH
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install Vim Plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
               https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    echo ">>> [Install programs] Install NVM completed."

    echo ">>> [Install programs] Complete."
}

# Set configurations for programs, and copy of dot files.
set_configs() {
    echo ">>> [Set configs] Configuration started..."

    echo ">>> [Set configs] Copying config files..."
    mkdir ~/.config/alacritty && cp dot-files/alacritty.yml ~/.config/alacritty/
    mkdir ~/.config/nvim && cp dot-files/init.vim ~/.config/nvim/
    mkdir ~/.config/zsh && cp dot-files/minimal.zsh ~/.config/zsh/
    mkdir ~/.config/tmux && cp dot-files/tmux.conf ~/.config/tmux/
    cp dot-files/vimrc ~/.vimrc
    cp dot-files/zshrc ~/.zshrc
    cp dot-files/gitconfig ~/.gitconfig

    echo ">>> [Set configs] Setting Git variables..."
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"

    echo ">>> [Set configs] Creating Cmus update script..."
    mkdir ~/.config/cmus
    cp dot-files/update-library.sh ~/.config/cmus/update-library.sh
    chmod +x ~/.config/cmus/update-library.sh
    cmus-remote --raw ":bind -f common u shell ~/.config/cmus/update-library.sh"

    echo ">>> [Set configs] Configuration complete."
}

# Run the two main functions from here.
install_programs
set_configs

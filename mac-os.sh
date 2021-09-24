#!/bin/bash

WORKING_DIR=$(pwd)
DOT_FILES_DIR="./dot-files"
GIT_EMAIL=""
GIT_USERNAME=""

install_programs() {
    echo ">>> [Install programs] Started..."

    echo ">>> [Install programs] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo ">>> [Install programs] Homebrew install complete."

    echo ">>> [Install programs] Installing apps with brew..."
    brew install pass pass-otp tmux cmus neovim nodejs youtube-dl
    brew install --cask hyper
    echo ">>> [Install programs] Install brew apps completed."

    echo ">>> [Install programs] Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    # Load MVN.
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install latest node version.
    nvm install node
    
    echo ">>> [Install programs] Install NVM completed."

    echo ">>> [Install programs] Complete."
}

set_configs() {
    echo ">>> [Set configs] Configuration started..."

    echo ">>> [Set configs] Setting Git variables..."
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"
    git config --global pager.branch false
    git config --global push.default current

    echo ">>> [Set configs] Copying config files..."
    cp "$DOT_FILES_DIR/bashrc" ~/.bashrc
    cp "$DOT_FILES_DIR/vimrc" ~/.vimrc
    cp "$DOT_FILES_DIR/tmux.conf" ~/.config/tmux/tmux.conf
    cp "$DOT_FILES_DIR/init.vim" ~/.config/nvim/init.vim
    cp "$DOT_FILES_DIR/hyper.js" ~/.hyper.js

    echo ">>> [Set configs] Creating Cmus update script..."
    mkdir -p ~/.config/cmus
    cp "$DOT_FILES_DIR/cmus-update-script.sh" ~/.config/cmus/update-library.sh
    chmod +x ~/.config/cmus/update-library.sh
    cmus-remote --raw ":bind -f common u shell ~/.config/cmus/update-library.sh"

    echo ">>> [Set configs] Configuration complete."
}

install_programs
set_configs

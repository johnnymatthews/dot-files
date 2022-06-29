#!/bin/bash

# Define Git variables here.
GIT_EMAIL=""
GIT_USERNAME=""

# Check if Git variables have been defined. Exit script if not.
[[ -z "$GIT_EMAIL" ]] && { echo "Error: GIT_EMAIL variable is empty. Exiting script." ; exit 1; }
[[ -z "$GIT_USERNAME" ]] && { echo "Error: GIT_USERNAME variable is empty. Exiting script." ; exit 1; }

install_programs() {
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Brew apps
    brew install pass pass-otp tmux cmus neovim nodejs youtube-dl zsh
    brew install --cask hyper

    # Install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    # Load NVM.
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install latest node version.
    nvm install node

    # Configure ZSH
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion   

    # Install Vim Plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
               https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Install YT-DLP
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
}

set_configs() {

    # Copy config files to appropriate dirs.
    mkdir ~/.config/alacritty && cp dot-files/alacritty.yml ~/.config/alacritty/
    mkdir ~/.config/nvim && cp dot-files/init.vim ~/.config/nvim/
    mkdir ~/.config/zsh && cp dot-files/minimal.zsh ~/.config/zsh/
    mkdir ~/.config/tmux && cp dot-files/tmux.conf ~/.config/tmux/
    cp dot-files/vimrc ~/.vimrc
    cp dot-files/zshrc ~/.zshrc
    cp dot-files/gitconfig ~/.gitconfig

    # Set Git variables
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"

    # Create CMUS update script and set it.
    mkdir ~/.config/cmus
    cp scripts/update-library.sh ~/.config/cmus/update-library.sh
    chmod +x ~/.config/cmus/update-library.sh
    cmus-remote --raw ":bind -f common u shell ~/.config/cmus/update-library.sh"
}

# Run the two main functions from here.
install_programs
set_configs

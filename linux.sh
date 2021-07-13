#!/bin/bash

WORKING_DIR=$(pwd)
GIT_EMAIL=""
GIT_USERNAME=""
SSH_KEY_COMMENT=""

main() {
    echo "==================== START OF SCRIPT ===================="
    echo ""
    
    apt_update_utils
    programs_cmus
    programs_node_js
    programs_pandoc
    programs_python3
    programs_unix_pass
    programs_neovim
    programs_tmux
    programs_youtube_dl
    programs_zsh

    echo ""
    echo "==================== END OF SCRIPT ===================="
}

apt_update_utils() {
    echo ">>> [APT and utils] Configuration started..."

    echo ">>> [APT and utils] Updating apt, cache, and install upgrades..."
    sudo apt update -y && apt upgrade -y
    sudo apt install git wget build-essential htop -y
     
    echo ">>> [APT and utils] Setting Git variables..."
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"
    git config --global pager.branch false
    git config --global push.default current

    echo ">>> [APT and utils] Creating SSH keypair..."
    ssh-keygen -t rsa -b 4096 -C "$SSH_KEY_COMMENT"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    
    echo ">>> [APT and utils] Copying config files..."
    cp dot-files/zshrc ~/.zshrc
    cp dot-files/vimrc ~/.vimrc

    echo ">>> [APT and utils] Removing Nano..."
    apt remove nano -y

    echo ">>> [APT and utils] Configuration complete."
}

programs_cmus() {
    echo ">>> [Cmus] Install started..."

    echo ">>> [Cmus] Installing Cmus..."
    sudo apt install cmus -y

    echo ">>> [Cmus] Creating Cmus update script..."
    mkdir -p ~/.config/cmus
    mv dot-files/cmus-update-script.sh ~/.config/cmus/update-library.sh
    chmod +x ~/.config/cmus/update-library.sh

    echo ">>> [Cmus] Binding update script to U key..."
    cmus-remote --raw ":bind -f common u shell ~/.config/cmus/update-library.sh"

    echo ">>> [Cmus] Install complete."
}

programs_node_js() {
    echo ">>> [Node.js] Install started..."

    echo ">>> [Node.js] Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  

    echo ">>> [Node.js] Installing Node.js and NPM with NVM"
    nvm install node 

    echo ">>> [Node.js] Install complete."
}

programs_pandoc() {
    echo ">>> [Pandoc] Install started..."

    echo ">>> [Pandoc] Installing Pandoc and WKHTMLtoPDF..."
    sudo apt install pandoc wkhtmltopdf  -y
    
    echo ">>> [Pandoc] Install complete."
}

programs_python3() {
    echo ">>> [Python3] Install started..."

    echo ">>> [Python3] Installing Python3..."
    sudo apt-get install python-is-python3 -y

    echo ">>> [Python3] Removing Python2..."
    sudo apt-get autoremove --purge

    echo ">>> [Python3] Install complete."
}

programs_tmux() {
    echo ">>> [Tmux] Install started..."

    echo ">>> [Tmux] Installing Tmux..."
    sudo apt install tmux -y
    cp dot-files/tmux.conf ~/.tmux.conf

    echo ">>> [Tmux] Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo ">>> [Tmux] Install complete."
}

programs_unix_pass() {
    echo ">>> [Unix Pass] Install started..."

    echo ">>> [Unix Pass] Installing Unix Pass..."
    sudo apt install pass -y

    echo ">>> [Unix Pass] Installing Pass OTP..."
    sudo apt install pass-extension-otp oathtool zbar-tools -y

    echo ">>> [Unix Pass] Installing Pass Update..."
    git clone https://github.com/roddhjav/pass-update/ ~/Downloads/pass-update
    cd ~/Downloads/pass-update
    sudo make install
    cd $WORKING_DIR

    echo ">>> [Unix Pass] Install complete."
}

programs_neovim() {
    echo ">>> [NeoVim] Install started..."

    echo ">>> [NeoVim] Installing NeoVim..."
    sudo apt install neovim -y

    mkdir -p ~/.config/nvim
    cp dot-files/init.vim ~/.config/nvim

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
               https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    echo ">>> [NeoVim] Install complete."
}

programs_youtube_dl() {
    echo ">>> [Youtube-dl] Install started..."

    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
    
    echo ">>> [Youtube-dl] Installing ffmpeg..."
    sudo apt install ffmpeg -y

    echo ">>> [Youtube-dl] Install complete."
}

programs_zsh() {
    echo ">>> [Zsh] Install started..."

    echo ">>> [Zsh] Installing Zsh..."
    sudo apt install zsh -y

    mkdir -p ~/.config/zsh
    cp dot-files/minimal.zsh ~/.config/zsh

    echo ">>> [Zsh] Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo ">>> [Zsh] Install complete."
}

main

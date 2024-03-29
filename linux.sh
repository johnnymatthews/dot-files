#!/bin/bash

WORKING_DIR=$(pwd)
GIT_EMAIL=""
GIT_USERNAME=""
SSH_KEY_COMMENT=""

main() {
    echo "==================== START OF SCRIPT ===================="
    echo ""
    
    apt_update_utils
    programs_alacritty
    programs_brave
    programs_cmus
    programs_gnome_tweaks
    programs_node_js
    programs_pandoc
    programs_python3
    programs_unix_pass
    programs_neovim
    programs_tmux
    programs_ytdlp
    programs_zsh

    echo ""
    echo "==================== END OF SCRIPT ===================="
}

apt_update_utils() {
    echo ">>> [APT and utils] Configuration started..."

    echo ">>> [APT and utils] Updating apt, cache, and install upgrades..."
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install git wget build-essential htop atool snap -y
     
    echo ">>> [APT and utils] Setting Git variables..."
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"

    echo ">>> [APT and utils] Creating SSH keypair..."
    ssh-keygen -t rsa -b 4096 -C "$SSH_KEY_COMMENT"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    
    echo ">>> [APT and utils] Copying config files..."
    cp ./configs/zshrc ~/.zshrc
    cp ./configs/vimrc ~/.vimrc
    sudo apt remove nano -y

    echo ">>> [APT and utils] Configuration complete."
}

programs_alacritty() {
    echo ">>> [Alacritty] Install started..."

    sudo apt install alacritty -y
    mkdir ~/.config/alacritty
    cp ./configs/alacritty.yml ~/.config/alacritty/

    echo ">>> [Alacritty] Install complete."
}


programs_brave() {
    echo ">>> [Brave] Install started..."

    sudo apt install apt-transport-https curl -y
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update -y
    sudo apt install brave-browser -y

    echo ">>> [Brave] Install complete."
}


programs_cmus() {
    echo ">>> [Cmus] Install started..."

    sudo apt install cmus -y
    mkdir -p ~/.config/cmus
    mv ./configs/scripts/update-library.sh ~/.config/cmus/update-library.sh
    chmod +x ~/.config/cmus/update-library.sh
    cmus-remote --raw ":bind -f common u shell ~/.config/cmus/update-library.sh"

    echo ">>> [Cmus] Install complete."
}

programs_gnome_tweaks() {
    echo ">>> [Gnome Tweaks] Install started..."

    sudo apt install gnome-tweaks gnome-shell-extension-autohidetopbar -y

    echo ">>> [Gnome Tweaks] Install complete."
}

programs_node_js() {
    echo ">>> [Node.js] Install started..."

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  
    nvm install node 
    npm install -g alacritty-themes

    echo ">>> [Node.js] Install complete."
}

programs_pandoc() {
    echo ">>> [Pandoc] Install started..."

    sudo apt install pandoc wkhtmltopdf  -y
    
    echo ">>> [Pandoc] Install complete."
}

programs_python3() {
    echo ">>> [Python3] Install started..."

    sudo apt-get install python-is-python3 -y
    sudo apt-get autoremove --purge

    echo ">>> [Python3] Install complete."
}

programs_signal() {
    # Steps taken from Signal's official guidelines: https://signal.org/en/download
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
    cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
    sudo apt update && sudo apt install signal-desktop
}

programs_tmux() {
    echo ">>> [Tmux] Install started..."

    sudo apt install tmux -y
    cp ./configs/tmux.conf ~/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo ">>> [Tmux] Install complete."
}

programs_unix_pass() {
    echo ">>> [Unix Pass] Install started..."

    sudo apt install pass -y
    sudo apt install pass-extension-otp oathtool zbar-tools -y
    git clone https://github.com/roddhjav/pass-update/ ~/Downloads/pass-update
    cd ~/Downloads/pass-update
    sudo make install
    cd $WORKING_DIR
    rm -rf ~/Downloads/pass-update

    echo ">>> [Unix Pass] Install complete."
}

programs_neovim() {
    echo ">>> [NeoVim] Install started..."

    sudo apt install neovim -y
    mkdir -p ~/.config/nvim
    cp ./configs/init.vim ~/.config/nvim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    echo ">>> [NeoVim] Install complete."
}

programs_ytdlp() {
    echo ">>> [Youtube-dl] Install started..."

    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp

    echo ">>> [Youtube-dl] Install complete."
}

programs_zsh() {
    echo ">>> [Zsh] Install started..."

    sudo apt install zsh -y
    mkdir -p ~/.config/zsh
    cp ./configs/minimal.zsh ~/.config/zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo ">>> [Zsh] Install complete."
}

main

# Dot files

My collection of configuration files, along with some repos that are useful to have. Everything within `firefox` is specific to getting vertical tabs enabled, and hiding the URL bar. See [johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox](https://johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox/) for more info on that.

## MacOS

Follow these steps to get everything needed on MacOS:

1. Install Homebrew:

    ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/johnny/.zprofile\n    eval "$(/opt/homebrew/bin/brew shellenv)"
    ```

1. Install Homebrew packages:

    ```shell
    brew install --cask firefox
    brew install --cask alacritty
    brew install --cask alt-tab
    brew install --cask bitwarden
    brew install --cask firefox
    brew install neovim —HEAD
    brew install --cask rectangle
    brew install cmus
    brew install tmux
    ```

1. Install Node Version Manager:

    ```shell
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash_completion
    export NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm\n[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completio
    ```

1. Install Node and NPM:

    ```shell
    nvm install --lts
    ```

1. Install Rust:

    ```shell
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
    ```

    Follow the interactive steps.

1. Install oh-my-zsh:

    ```shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mv ~/.oh-my-zsh ~/.config/oh-my-zsh
    ```

1. Clone dot-files and move them around:

    ```shell
    mkdir ~/Code
    git clone https://github.com/johnnymatthews/dot-files ~/Code/dot-files
    cp -r ~/Code/dot-files/config ~/.config
    cp ~/Code/dot-files/home/zshrc ~/.zshrc
    cp ~/Code/dot-files/home/gitconfig ~/.gitconfig
    ```

1. Install Tmux Plugin Manager:

    ```shell
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    ```

1. Clone Simple Nvim:

    ```shell
    git clone https://github.com/johnnymatthews/simple-nvim ~/.config/nvim
    ```

That's about it!

## Ubuntu

Follow these steps to get everything I need installed for Ubuntu-based systems.

```shell
# General updates and upgrades.
sudo apt update -y && sudo apt upgrade -y

# Install apt packages.
sudo apt install atool build-essential cmus htop pandoc tmux snapd xclip zsh -y

# Generate SSH key.
ssh-keygen -t ed25519 -C "NAME_HERE"

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Lazygit.
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install Node Version Manager.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Install Node.
nvm install node

# Install PNPM.
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install Rust.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Once all that's done, close and reopen the terminal and run:

```shell
# Move things to ~/.config.
mkdir ~/.config
cp ~/dot-files/config/* ~/.config/

# Move ~ specific configs to home.
cp ~/dot-files/home/zshrc ~/.zshrc
cp ~/dot-files/home/gitconfig ~/.gitconfig

# Grab Nvim setup from Git.
git clone https://github.com/johnnymatthews/simple-nvim ~/.config/nvim

# Move the oh-my-zsh stuff into config folder.
mv ~/.oh-my-zsh ~/.config/oh-my-zsh

# Download the git-prompt repo.
git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.config/zsh/git-prompt-zsh

# Source the ~/.zshrc file.
source ~/.zshrc
```

Install the following extras, if you fancy. They're mostly GUI installers though.

1.  Install [Gnome Extensions browser add-on](https://extensions.gnome.org/)
1.  Enable [Hide Top Bar](https://extensions.gnome.org/extension/545/hide-top-bar/)
1.  Install [Jetbrains Nerdfont](https://www.nerdfonts.com/font-downloads)
1.  Clone Catppuccin theme for Alacritty:

        ```shell
        mkdir -p ~/.config/alacritty
        curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-latte.toml
        curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-frappe.toml
        curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml
        curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
        ```

1.  Install Mega:

        ```shell
        wget https://mega.nz/linux/repo/xUbuntu_23.10/amd64/megasync-xUbuntu_23.10_amd64.deb && sudo apt install \"$PWD/megasync-xUbuntu_23.10_amd64.deb\"
        ```

1.  Install Snap packages:

        ```shell
        sudo snap install alacritty --classic
        sudo snap install bitwarden
        sudo snap install ffmpeg
        sudo snap install mc-installer
        sudo snap install nvim --classic
        sudo snap install transmission
        sudo snap install vlc
        sudo snap install yt-dlp
        ```

1. Done!

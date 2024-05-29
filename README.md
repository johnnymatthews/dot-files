# Config

My collection of configuration files, along with some repos that are useful to have. Everything in `/config` belongs in `~/.config`. So running something like `cp -r ./config/* ~/.config/` would probably get everything sorted.

Everything within `firefox` is specific to getting vertical tabs enabled, and hiding the URL bar. See [johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox](https://johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox/) for more info on that.

Lastly, `gitconfig` and `zshrc` need to be moved to `~/`, and a `.` added at the start. So running `cp ./gitconfig ~/.gitconfig && cp ./zshrc ~/.zshrc` would probably work.

## Ubuntu

Follow these steps to get everything I need installed for Ubuntu-based systems.

```shell
# General updates and upgrades.
sudo apt update -y && sudo apt upgrade -y

# Install apt packages.
sudo apt install atool build-essential cmus htop tmux snapd xclip zsh -y

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

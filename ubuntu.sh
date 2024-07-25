# General updates and upgrades.
sudo apt update -y && sudo apt upgrade -y

# Fix WSL time issue.
sudo hwclock -s
sudo apt install ntpdate -y
sudo ntpdate time.nist.gov

# Install apt packages.
sudo apt install atool build-essential cmus htop jq pandoc tmux tree snapd xclip zsh -y

# Generate SSH key.
ssh-keygen -t ed25519 -C "io@weaver"

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

# Clone down dot-files.
mkdir ~/Code
git clone https://github.com/johnnymatthews/dot-files ~/Code/dot-files

# Move things to ~/.config.
mkdir ~/.config
cp -r ~/Code/dot-files/config/* ~/.config/

# Move ~ specific configs to home.
cp ~/Code/dot-files/home/zshrc ~/.zshrc
cp ~/Code/dot-files/home/gitconfig ~/.gitconfig

# Download the git-prompt repo.
git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.config/zsh/git-prompt-zsh

# Grab Nvim setup from Git.
git clone https://github.com/johnnymatthews/simple-nvim ~/.config/nvim

# Install oh-my-zsh to a custom location.
export ZSH=~/.config/oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.oh-my-zsh ~/.config/oh-my-zsh

# Change shell to use ZSH.
sudo chsh --shell /bin/zsh

# Move things to ~/.config.
mkdir ~/.config
cp -r ~/Code/dot-files/config/* ~/.config/

# Move ~ specific configs to home.
cp ~/Code/dot-files/home/zshrc ~/.zshrc
cp ~/Code/dot-files/home/gitconfig ~/.gitconfig

# Install Tmux Plugin Manager.
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Install latest stable Neovim.
cd ~
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc

# Source the ~/.zshrc file.
source ~/.zshrc

# Clean up.
rm -rf ~/lazygit ~/lazygit.tar.gz ~/nvim-linux64.tar.gz ~/.zshrc.pre-oh-my-zsh ~/.wget-hsts ~/.viminfo 

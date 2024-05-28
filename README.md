# Config

My collection of configuration files, along with some repos that are useful to have. Everything in `/config` belongs in `~/.config`. So running something like `cp -r ./config/* ~/.config/` would probably get everything sorted.

Everything within `firefox` is specific to getting vertical tabs enabled, and hiding the URL bar. See [johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox](https://johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox/) for more info on that.

Lastly, `gitconfig` and `zshrc` need to be moved to `~/`, and a `.` added at the start. So running `cp ./gitconfig ~/.gitconfig && cp ./zshrc ~/.zshrc` would probably work.

## Ubuntu

Follow these steps to get everything I need installed for Ubuntu-based systems.

1. General updates and upgrades:

	```shell
	sudo apt update -y && sudo apt upgrade -y
	```
	
1. Install apt packages:

	```shell
	sudo apt install atool cmus htop tmux snapd xclip zsh -y
	```
	
1. Install oh-my-zsh:

	```shell
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	```
	
1. Install Snap packages:

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
	
1. Install Node Version Manager:

	```shell
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	```
	
1. Install [Gnome Extensions browser add-on](https://extensions.gnome.org/)
1. Enable [Hide Top Bar](https://extensions.gnome.org/extension/545/hide-top-bar/)
1. Install [Jetbrains Nerdfont](https://www.nerdfonts.com/font-downloads)
1. Clone Catppuccin theme for Alacritty:

    ```shell
    mkdir -p ~/.config/alacritty
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-latte.toml
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-frappe.toml
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
    ```

1. Install Mega:

	```shell
	wget https://mega.nz/linux/repo/xUbuntu_23.10/amd64/megasync-xUbuntu_23.10_amd64.deb && sudo apt install \"$PWD/megasync-xUbuntu_23.10_amd64.deb\"
	```

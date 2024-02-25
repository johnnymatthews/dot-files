# Config

My collection of configuration files, along with some repos that are useful to have. Everything in `/config` belongs in `~/.config`. So running something like `cp -r ./config/* ~/.config/` would probably get everything sorted.

Everything within `firefox` is specific to getting vertical tabs enabled, and hiding the URL bar. See [johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox](https://johnnymatthews.dev/blog/2023-10-04-vertical-tabs-in-firefox/) for more info on that.

Lastly, `gitconfig` and `zshrc` need to be moved to `~/`, and a `.` added at the start. So running `cp ./gitconfig ~/.gitconfig && cp ./zshrc ~/.zshrc` would probably work.

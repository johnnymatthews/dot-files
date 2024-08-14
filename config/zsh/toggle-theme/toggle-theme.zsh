toggle_theme() {
  local ALACRITTY_CONFIG_PATH="/mnt/c/Users/johnny/AppData/Roaming/alacritty"
  local DARK_CONFIG="$ALACRITTY_CONFIG_PATH/alacritty-dark.toml"
  local LIGHT_CONFIG="$ALACRITTY_CONFIG_PATH/alacritty-light.toml"
  local TARGET_CONFIG="$ALACRITTY_CONFIG_PATH/alacritty.toml"
  local NVIM_CONFIG="$HOME/.config/nvim/init.lua"

    # Check if argument is provided.
    if [ $# -eq 0 ]; then
      echo "Error: No argument provided. Please use 'dark' or 'light'."
      return 1
    fi

    # Check if config directory exists.
    if [ ! -d "$ALACRITTY_CONFIG_PATH" ]; then
      echo "Error: Alacritty config directory not found at $ALACRITTY_CONFIG_PATH"
      return 1
    fi

    # Check if Neovim config file exists.
    if [ ! -f "$NVIM_CONFIG" ]; then
      echo "Error: Neovim config file not found at $NVIM_CONFIG"
      return 1
    fi

    if [ "$1" = "dark" ]; then
      if [ ! -f "$DARK_CONFIG" ]; then
        echo "Error: Dark theme configuration file not found at $DARK_CONFIG"
        return 1
      fi
      cat "$DARK_CONFIG" > "$TARGET_CONFIG"

              # Update Neovim config
              sed -i 's/latte/mocha/g' "$NVIM_CONFIG"
            elif [ "$1" = "light" ]; then
              if [ ! -f "$LIGHT_CONFIG" ]; then
                echo "Error: Light theme configuration file not found at $LIGHT_CONFIG"
                return 1
              fi
              cat "$LIGHT_CONFIG" > "$TARGET_CONFIG"

        # Update Neovim config
        sed -i 's/mocha/latte/g' "$NVIM_CONFIG"
      else
        echo "Error: Invalid argument. Please use 'dark' or 'light'."
        return 1
    fi

    # Check if the Alacritty configuration update was successful.
    if [ $? -ne 0 ]; then
      echo "Error: Failed to update Alacritty configuration."
      return 1
    fi

    # Check if the Neovim configuration update was successful.
    if [ $? -ne 0 ]; then
      echo "Error: Failed to update Neovim configuration."
      return 1
    fi

    echo "Alacritty and Neovim configurations updated successfully to $1 theme."
  }

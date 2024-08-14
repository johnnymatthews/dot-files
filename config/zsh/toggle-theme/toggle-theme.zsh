function toggle-theme() {
  ALACRITTY_CONFIG_PATH="/mnt/c/Users/johnny/AppData/Roaming/alacritty"

  if [ "$1" = "dark" ]; then
      cat "$ALACRITTY_CONFIG_PATH/alacritty-dark.toml" > "$ALACRITTY_CONFIG_PATH/alacritty.toml"
  elif [ "$1" = "light" ]; then
      cat "$ALACRITTY_CONFIG_PATH/alacritty-light.toml" > "$ALACRITTY_CONFIG_PATH/alacritty.toml"
  else
      echo "Invalid argument. Please use 'dark' or 'light'."
      exit 1
  fi

  echo "Alacritty configuration updated successfully."
}

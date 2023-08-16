default_app = {
  terminal = "kitty",
  editor = os.getenv("EDITOR") or "nvim",
  browser = "firefox",
  file_manager = "thunar",
  menubar = "rofi -show drun -show-icons -theme ~/.config/rofi/arc-dark.rasi",
  calculator = "rofi -show calc -modi calc -no-show-match -no-sort -kb-accept-entry Control+Return -kb-accept-custom Return -calc-command \"echo -n '{result}' | xclip -sel clip\" -theme ~/.config/rofi/arc-dark.rasi",
}

return default_app

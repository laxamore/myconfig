default_app = {
  terminal = "kitty",
  editor = os.getenv("EDITOR") or "nvim",
  browser = "firefox",
  file_manager = "pcmanfm-qt",
  menubar = "rofi -show drun -show-icons -theme ~/.config/rofi/arc-dark.rasi",
  calc = "rofi -show calc -modi calc -no-show-match -no-sort -theme ~/.config/rofi/arc-dark.rasi",
}

return default_app
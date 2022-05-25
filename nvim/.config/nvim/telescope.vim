lua << EOF
require("telescope").setup {
  pickers = {
    find_files = {
      find_command = { "fd", "-L", "-H" }
    },
  }
}
EOF

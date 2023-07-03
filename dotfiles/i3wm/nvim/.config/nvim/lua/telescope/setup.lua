require('telescope.plugin')

local function setup()
  require("telescope").setup {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git" },
      preview = false,
    },
    pickers = {
      find_files = {
        find_command = { "fd", "-L", "-H" }
      },
    }
  }
  require('telescope.mapping')
end
pcall(setup)

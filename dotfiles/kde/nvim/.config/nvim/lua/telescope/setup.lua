require('telescope.plugin')

local function setup()
  require("telescope").setup {
    defaults = {
      file_ignore_patterns = { "node_modules" },
      preview = false,
    },
    pickers = {
      find_files = {
        find_command = { "fd", "-L", "-H" }
      },
      live_grep = {
        additional_args = function(opts)
          return {"--hidden"}
        end
      },
    }
  }
  require('telescope.mapping')
end
pcall(setup)

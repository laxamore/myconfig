-- Plugins Manager With Packer
require('plugins')

-- General Settings
require('general.setup')
require('general.mapping')
-- End General Settings

-- External Plugins 
-- Colorscheme Require, Choose one
require('colorscheme.darkplus')
--require('colorscheme.monokai')

-- Fuzzy Finder
require('telescope.setup')

-- TreeSitter
require('treesitter.setup')

-- Nerdtree
require('nvim-tree.setup')

-- Commentary
require('commentary.setup')

-- Copilot
require('copilot.setup')

-- Vim Visual Multi
require('vim-visual-multi.setup')

-- Markdown Preview
require('markdown-preview.setup')

-- Language Serve & Completion & Snippets
require('intellisense.setup')

-- End External Plugins 


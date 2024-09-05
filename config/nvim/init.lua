-- Set runtimepath
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath using Vimscript command
vim.cmd('let &packpath=&runtimepath')


-- Source .vimrc
vim.cmd('source ~/.vimrc')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "json", "html", "css", "scss", "bash", "dockerfile", "lua", "pug", "ruby", "toml", "tsx", "vue", "yaml" },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = false,
  },
  endwise = {
    enable = true,
  },
}

require("nvim-autopairs").setup {}

-- Load Telescope
require('telescope').setup({
  defaults = {
    -- other defaults configuration here
  },
  pickers = {
    -- live_grep = {
    --   theme = "dropdown",
    --   layout_config = { width = 0.9 }
    -- },
    -- buffers = {
    --   theme = "dropdown",
    --   layout_config = { width = 0.9 }
    -- },
    -- help_tags = {
    --   theme = "dropdown",
    --   layout_config = { width = 0.9 }
    -- },
    -- find_files = {
    --   theme = "dropdown",
    --   layout_config = { width = 0.9 }
    -- }
  },
  -- other configuration values here
})

-- Load and enable the fzf-native extension
require('telescope').load_extension('fzf')

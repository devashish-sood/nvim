-- Basic Neovim settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.tabstop = 4                  -- Number of spaces tabs count for
vim.opt.shiftwidth = 4               -- Size of an indent
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.mouse = "a"                  -- Enable mouse support
vim.opt.splitbelow = true            -- Horizontal splits will automatically be below
vim.opt.splitright = true            -- Vertical splits will automatically be to the right
vim.opt.clipboard = "unnamedplus"    -- Use the system clipboard
vim.opt.ignorecase = true            -- Case insensitive searching
vim.opt.smartcase = true             -- Case sensitive searching when uppercase is used
vim.opt.wrap = false                 -- Disable line wrap

-- Improve UI
vim.opt.signcolumn = "yes"           -- Always show the sign column

-- Set up a simple key mapping to open and close the quickfix list
vim.api.nvim_set_keymap('n', '<leader>q', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})
vim.cmd [[
function! QuickFixToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
      {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons", -- optional, for file icons
        config = function()
            require'nvim-tree'.setup {
                disable_netrw = true,
                hijack_netrw = true,
                auto_close = true,
                open_on_tab = false,
                hijack_cursor = false,
                update_cwd = true,
                diagnostics = {
                    enable = false,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                -- More configuration options available...
            }
        end
    }, 
    { 'datsfilipe/vesper.nvim' }})

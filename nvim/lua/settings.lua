--local map = vim.api.nvim_set_keymap   -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	        -- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt             		-- global/buffer/windows-scoped options

-- g.mapleader = "<Space>"    -- change leader to a space
opt.mouse = 'a'               -- enable mouse support

opt.backup = false            -- creates a backup file
opt.writebackup = false
opt.swapfile = false          -- don't use swapfile
opt.undofile = true           -- enable persistent undo
opt.fileencoding = "utf-8"

opt.number = true             -- show line number
opt.relativenumber = true
opt.numberwidth = 5
opt.signcolumn = "yes"

opt.expandtab = true          -- use spaces instead of tabs
opt.shiftwidth = 4            -- shift 4 spaces when tab
opt.tabstop = 4               -- 1 tab == 4 spaces
opt.smartindent = true        -- autoindent new lines
opt.wrap = false              -- turn of wordwrapping

opt.showmode = false
opt.pumheight = 10
opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
opt.showtabline = 2
opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.hlsearch = true
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.showmatch = true          -- highlight matching parenthesis

opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')

opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom

opt.hidden = true             -- enable background buffers
opt.lazyredraw = true         -- faster scrolling
opt.synmaxcol = 240           -- max column for syntax highlight

opt.termguicolors = true      -- enable 24-bit RGB colors

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]


-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clear search highlighting
keymap('n', '<ESC><ESC>', ':nohl<CR>', opts)

-- move around splits using Ctrl + {h,j,k,l}
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)       -- open/close

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keep paste buffer as expected
keymap("v", "p", '"_dP', opts)

-- telescope
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Mapping

local nnoremap = function(lhs, rhs, silent)
	vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = silent})
end

local inoremap = function(lhs, rhs)
	vim.api.nvim_set_keymap('i', lhs, rhs, {noremap = true})
end

local vnoremap = function(lhs, rhs)
	vim.api.nvim_set_keymap('v', lhs, rhs, {noremap = true})
end


-- Esc from insert mode
inoremap('jk', '<Esc>')

-- Split navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

nnoremap('<TAB>', ':bnext<CR>')
nnoremap('<S-TAB>', 'bprevious<CR>')

nnoremap('<leader>v', ':vsplit<CR>')
nnoremap('<leader>h', ':split<CR>')
nnoremap('<leader>+', ':vertical resize +5<CR>')
nnoremap('<leader>-', ':vertical resize -5<CR>')

-- Nvim Tree
nnoremap('<C-n>', ':NvimTreeToggle<CR>')
nnoremap('<leader>r', ':NvimTreeRefresh')
nnoremap('<leader>f', ':NvimTreeFind')

-- TrueZen
nnoremap('<leader>w', ':TZAtaraxis<CR>')

-- Telescope
nnoremap('ff', ':Telescope find_files<CR>')
nnoremap('fb', ':Telescope buffers<CR>')

-- Bdelete
nnoremap('Q', ':Bdelete menu<CR>')
nnoremap('T', ':Bdelete this')

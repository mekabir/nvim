vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number

vim.opt.tabstop = 4 -- 4 space indents
vim.opt.softtabstop = 4 -- 4 space indents
vim.opt.shiftwidth = 4 -- 4 space indents
vim.opt.expandtab = true -- 4 space indents

vim.opt.smartindent = true -- smart indenting
vim.opt.autoindent = true -- auto apply indentation to next line

vim.opt.wrap = true -- word wrap

vim.opt.swapfile = false -- vim dont make swap files
vim.opt.backup = false -- vim dont make back up
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
-- No backups but want undotree
-- to have access to a long list of
-- undos so we can undo things from
-- days ago.
vim.opt.undofile = true

vim.opt.hlsearch = true -- keep search terms highlighted
vim.opt.incsearch = true -- highlight more and more of the
-- search terms as they are modified

vim.opt.termguicolors = true -- colors
vim.cmd([[ set background=dark ]]) -- sets background to either dark or light

vim.opt.scrolloff = 8 -- keep an 8 line offset while
-- scrolling
vim.signcolumn = "yes" --
vim.opt.isfname:append("@-@") --

vim.opt.updatetime = 50 -- fast update time

vim.opt.colorcolumn = "120" -- color columns
vim.g.mapleader = " " -- [Space] is the leader key.

-- for devicons
vim.opt_global.encoding = "utf-8"

vim.api.nvim_set_hl(0, "cursorline", { -- highlight cursorline
	underdashed = true,
})
--vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- to enable spot placing the cursor using the mouse
vim.o.mouse = 'a'

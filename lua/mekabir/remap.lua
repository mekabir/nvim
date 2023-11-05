-- declaring the leader
vim.g.mapleader = " "
-- while in normal mode ("n"), <leader>pv should launch the nvim file explorer.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- next two use the move command and when highlighted we can shift them around.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J take the line below and append it to the current line with space.
-- but this allows your cursor to remain at the same place instead of at end
vim.keymap.set("n", "J", "mzJ`z")

-- C-d and C-u allow half page jumping to just keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- n and N allow search terms to stay in the middle.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keeps the copied then pasted string in buffer instead of replacing it in the buffer with the string it replaced in the paste.
vim.keymap.set("x", "<leader>p", "'_dP")

-- <leader>y it now goes to the + register which is the system clipboard
-- which allows us to now pur subsequent copies into the system clipboard
-- and be able to paste the contents elsewhere.
-- y by itself will keep it in the vim clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deleting to void register
vim.keymap.set("n", "<leader>d", "'_d")
vim.keymap.set("v", "<leader>d", "'_d")

-- in vertical edit mode, if you just press C-c to exit it wont save the verical changes.this way it will.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- dont ever press Q.
vim.keymap.set("n", "Q", "<nop>")

-- Quick fix navigation from the quick fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- it will setup a find and replace string prepopulated with the word the cursor is on.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod a+x a file with a shebang into an executable.
vim.keymap.set("n", "<leader>x", "<cmd>! chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", vim.cmd("so"))
vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("n", "<leader>fmt", "<cmd>Format<CR>")


-- insert === and date
vim.keymap.set("n", "<leader>==", function()
    vim.cmd(string.format("insert\n=================%s=================", os.date("%m.%d.%Y")))
end)

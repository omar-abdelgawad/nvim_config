require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- "map"({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- (17/05/2025): I wanted to note that <C-i> for moving forward the
-- jump list is not working since tab key is remaped to switching tabs so 
-- try to fix this in the future

-- The following is my own custom mappings
-- Shift lines up and down in normal mode
map("n", "<A-k>", ":m .-2<CR>==",{ desc = "Shift line up", noremap = true, silent = true })
map("n", "<A-j>", ":m .+1<CR>==",{ desc = "Shift line down", noremap = true, silent = true })
-- Shift lines up and down in visual mode
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Shift block up", noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Shift block down", noremap = true, silent = true })

-- wrap a highlighted block with (braces)
-- maybe try to remap to have S at begining (S is equivalent to cc)
-- Edit (21/06/2025): removed gv at the end of each one as it bugged.
vim.keymap.set("v", "(", "<esc>`>a)<esc>`<i(<esc>", { remap = false})
vim.keymap.set("v", "{", "<esc>`>a}<esc>`<i{<esc>", { remap = false})
vim.keymap.set("v", "[", "<esc>`>a]<esc>`<i[<esc>", { remap = false})
vim.keymap.set("v", "\"", "<esc>`>a\"<esc>`<i\"<esc>", { remap = false})
vim.keymap.set("v", "\'", "<esc>`>a\'<esc>`<i\'<esc>", { remap = false})


-- 21/07/2025 add shortcut for code action mainly for match arm
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- 03/04/2026 remove nvim terminal bindings
-- there were multiple mappings to remove such as `Alt + v or h or i` and `leader + v or h` and the eccentric `pressing Esc + i at the same exact time` for a floating window. I realized that I don't need to remove all of them as it can cause errors I don't understand so I just removed two of them
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
-- vim.keymap.del("n", "<Esc>i")

-- These are the ones I use frequently and hopefully I can replace them in the future with tmux or zellij
-- vim.keymap.del({ "n", "t" }, "<A-v>")
-- vim.keymap.del({ "n", "t" }, "<A-h>")
-- vim.keymap.del({ "n", "t" }, "<A-i>")

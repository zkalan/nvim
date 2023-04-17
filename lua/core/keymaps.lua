-- 主键设置
vim.g.mapleader = " "

local keymap = vim.keymap

---------------- 插入模式----------------
keymap.set("i", "jk", "<ESC>")

----------------- 视觉模式--------------
-- 单行或多行移动
keymap.set("v", "jk", "<ESC>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

----------------- 普通模式-------------
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平划分窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直划分窗口
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")
-- bufferline 文件标题 快速跳转
keymap.set("n", "<leader>bf", ":BufferLinePick<CR>")
-- bufferline 文件标题 快速关闭
keymap.set("n", "<leader>bfc", ":BufferLinePickClose<CR>")

----------------- Terminal 模式-------------
keymap.set("t", "jk", "<C-\\><C-N>")


------------------- 插件-----------------
-- nvim-tree
--:NvimTreeToggle Open or close the tree. Takes an optional path argument.
--:NvimTreeFocus Open the tree if it is closed, and then focus on the tree.
--:NvimTreeFindFile Move the cursor in the tree for the current buffer, opening folders if needed.
--:NvimTreeCollapse Collapses the nvim-tree recursively.
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<leader>l", ":bnext<CR>")
keymap.set("n", "<leader>h", ":bprevious<CR>")
-- keymap.set("n", "<C-H>", ":bprevious<CR>")

-- keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")

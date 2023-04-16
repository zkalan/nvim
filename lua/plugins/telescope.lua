local builtin = require('telescope.builtin')

-- 进入 telescope 页面会是插入模式，回到正常模式就可以使用j和k移动
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fb', builtin.help_tags, {})

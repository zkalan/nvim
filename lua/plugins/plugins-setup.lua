-- 自安装 packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- 主题插件
  use { -- 状态栏
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- 状态栏图标
  } 
  use {
    'nvim-tree/nvim-tree.lua', -- 目录树
    requires = {
      'nvim-tree/nvim-web-devicons', -- 图标
    }
  }
  use 'christoomey/vim-tmux-navigator' --使用ctrl-hjkl来移动光标到窗口
  use 'nvim-treesitter/nvim-treesitter' -- 语法高亮
  use 'p00f/nvim-ts-rainbow' -- 配置treesitter, 不同括号用颜色区分
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", -- 相当于mason.nvim和lspconfig桥梁
      "neovim/nvim-lspconfig"
  }    
  -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use 'numToStr/Comment.nvim' -- gcc和gc注释
  use 'windwp/nvim-autopairs' -- 自动补全括号

  use 'akinsho/bufferline.nvim' -- buffer分割线
  use 'lewis6991/gitsigns.nvim' -- 左侧git提示
  use  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'}}
  }
  -- 最强大的移动工具 sjsp/dyv-xjsp S
  use 'ggandor/leap.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


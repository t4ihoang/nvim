-- Auto install packer.nvim if it missing
local install_path = DATA_PATH..'/site/pack/packer/start/packer.nvim'

if FN.empty(FN.glob(install_path)) > 0 then
  SHCMD({'git', 'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Auto reloads neovim whenever save plugins.lua dile
CMD [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local use = require('packer').use
return require('packer').startup(function()
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'tiagovla/tokyodark.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'windwp/nvim-ts-autotag'

  -- Icon
  use 'kyazdani42/nvim-web-devicons'

  -- File explore tree
  use 'kyazdani42/nvim-tree.lua'

  -- Tab/Status bar plugins
  use 'romgrk/barbar.nvim'
  use 'glepnir/galaxyline.nvim'

  -- Auto completion
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Fuzzy find
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Terminal
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Git plugin
  use 'lewis6991/gitsigns.nvim'

  -- Other
  use 'jiangmiao/auto-pairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'easymotion/vim-easymotion'
end)

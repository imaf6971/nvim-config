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
  use "nvim-lua/plenary.nvim"

  -- neo-tree for sidebar treenavigation
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

  -- treesitter for beautiful code colors
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('plugins.treesitter')
		end
	}

  use "christoomey/vim-tmux-navigator"
  use "szw/vim-maximizer"

  -- comment plugin
  use "numToStr/Comment.nvim"

  -- colorscheme
  use "sainnhe/gruvbox-material"

  -- lualine (bottom statusline)
  use "nvim-lualine/lualine.nvim"

  -- telescope (fast file search)
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.1'
  }

  -- autocompletions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- mason for managing and installing lsp servers
  use "williamboman/mason.nvim"

  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  use "hrsh7th/cmp-nvim-lsp"
  use {
    "glepnir/lspsaga.nvim",
    branch = "main"
  }
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind.nvim"

  -- terminal plugin
  use {
    "s1n7ax/nvim-terminal",
    config = function()
      vim.o.hidden = true
      require('nvim-terminal').setup()
    end
  }

  -- git integration
  use {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require('gitsigns').setup()
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup {}
    end
  }
  use "windwp/nvim-ts-autotag"

  use {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons"
  }

  use "lukas-reineke/indent-blankline.nvim"
  use {
    "nvim-neorg/neorg",
    config = function ()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.concealer"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                notes = '~/notes'
              }
            }
          }
        }
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
  }
	if packer_bootstrap then
		require('packer').sync()
	end
end)

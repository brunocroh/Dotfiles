-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
--
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  use "tpope/vim-abolish"
  use 'Exafunction/codeium.vim'
  use 'wbthomason/packer.nvim'
  use 'habamax/vim-godot'
  use 'Mofiqul/dracula.nvim'

  use "mfussenegger/nvim-jdtls"
  use "f-person/git-blame.nvim"
  use "airblade/vim-gitgutter"
  use "jxnblk/vim-mdx-js"
  use "tpope/vim-fugitive"

  use 'kabouzeid/nvim-lspinstall'

  use ({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })

  use 'nvim-lua/plenary.nviM'
  use 'easymotion/vim-easymotion'
  use 'ap/vim-css-color'
  use ({
    'mattkubej/jest.nvim',
    config = function()
      require('brunocroh.plugins.jest')
    end
  })

  -- Debug --
  use ({
    'mfussenegger/nvim-dap',
    config = function()
      require('brunocroh.plugins.dap')
    end
  })

  use 'kyazdani42/nvim-web-devicons'

  use ({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('brunocroh.plugins.lsp.trouble')
    end
  })

  -- Visual --
 use 'morhetz/gruvbox'
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('brunocroh.plugins.lualine')
    end,
  })

  -- File Manger --
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- file icons
    },
    config = function()
      require('brunocroh.plugins.nvim-tree')
    end,
  })

  -- Syntax --
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'CursorHold',
      run = ':TSUpdate',
      config = function()
        require('brunocroh.plugins.treesitter')
      end,
    },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
  })

  use "lukas-reineke/indent-blankline.nvim"

  -- Fuzzy --
  use({
    {
      'nvim-telescope/telescope.nvim',
      event = 'CursorHold',
      requires = {
        { "nvim-telescope/telescope-live-grep-args.nvim" },
      },
      config = function()
        require('brunocroh.plugins.telescope')
      end,
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end,
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
      after = 'telescope.nvim',
    },
  })

  -- Code completion --
  use({
    'mattn/emmet-vim',
    setup = function()
      vim.g.user_emmet_leader_key = ','
      vim.g.user_emmet_settings = {
        indent_blockelement = 1,
      }
    end,
  })
  use 'tpope/vim-surround'
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- LSP --
  use({
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = function()
      require('brunocroh.plugins.lsp.servers')
    end,
    requires = {
      {
        -- WARN: Unfortunately we won't be able to lazy load this
        'hrsh7th/cmp-nvim-lsp',
      },
    },
  })

  use({
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        require('brunocroh.plugins.lsp.nvim-cmp')
      end,
      requires = {
        {
          'L3MON4D3/LuaSnip',
          event = 'InsertEnter',
          config = function()
            require('brunocroh.plugins.lsp.luasnip')
          end,
          requires = {
            {
              'rafamadriz/friendly-snippets',
              event = 'CursorHold',
            },
          },
        },
      },
    },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufRead',
    config = function()
      require('brunocroh.plugins.lsp.null-ls')
    end,
  })

  use({
    'windwp/nvim-autopairs',
    event = 'InsertCharPre',
    after = 'nvim-cmp',
    config = function()
      require('brunocroh.plugins.pairs')
    end,
  })


  use({
    'williamboman/mason.nvim',
    config = function()
      require('brunocroh.plugins.mason')
    end
  })

  use({
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('brunocroh.plugins.mason-lspconfig')
    end
  })

  use({
    'j-hui/fidget.nvim',
    config = function()
      require('brunocroh.plugins.fidget')
    end
  })

  -- Tooling --
  use ({"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
    })
  end})

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

end)


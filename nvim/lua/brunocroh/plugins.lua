require("lazy").setup({
  "tpope/vim-abolish",
  'Exafunction/codeium.vim',
  'wbthomason/packer.nvim',
  'habamax/vim-godot',
  'Mofiqul/dracula.nvim',
  "mfussenegger/nvim-jdtls",
  "f-person/git-blame.nvim",
  "airblade/vim-gitgutter",
  "jxnblk/vim-mdx-js",
  "tpope/vim-fugitive",
  "folke/which-key.nvim",
  'kabouzeid/nvim-lspinstall',
  'easymotion/vim-easymotion',
  'ap/vim-css-color',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- file icons
    },
    config = function()
      require('brunocroh.plugins.nvim-tree')
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  'easymotion/vim-easymotion',
  'ap/vim-css-color',
  {
    'mattkubej/jest.nvim',
    config = function()
      require('brunocroh.plugins.jest')
    end
  },
  'kyazdani42/nvim-web-devicons',
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('brunocroh.plugins.lsp.trouble')
    end
  },
  {
    'morhetz/gruvbox',
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('brunocroh.plugins.lualine')
    end,
  },
  {
    {
      'nvim-treesitter/nvim-treesitter',
      builD = ':TSUpdate',
      config = function()
        require('brunocroh.plugins.treesitter')
      end,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    {
      'nvim-telescope/telescope.nvim',
      event = 'CursorHold',
      dependencies = {
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-symbols.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
          config = function()
            require('telescope').load_extension('fzf')
          end,
        },
      },
      config = function()
        require('brunocroh.plugins.telescope')
      end,
    },
  },
   -- Code completion --
  {
    'mattn/emmet-vim',
    setup = function()
      vim.g.user_emmet_leader_key = ','
      vim.g.user_emmet_settings = {
        indent_blockelement = 1,
      }
    end,
  },
  'tpope/vim-surround',
  {
    'haorenW1025/completion-nvim',
    opt = true,
    dependencies = {
      {'hrsh7th/vim-vsnip', opt = true},
      {'hrsh7th/vim-vsnip-integ', opt = true}
    }
  },
  -- LSP --
  {
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = function()
      require('brunocroh.plugins.lsp.servers')
    end,
    dependencies = {
      {
        -- WARN: Unfortunately we won't be able to lazy load this
        'hrsh7th/cmp-nvim-lsp',
      },
    },
  },
  {
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        require('brunocroh.plugins.lsp.nvim-cmp')
      end,
      dependencies = {
        {
          'L3MON4D3/LuaSnip',
          event = 'InsertEnter',
          config = function()
            require('brunocroh.plugins.lsp.luasnip')
          end,
          dependencies = {
            {
              'rafamadriz/friendly-snippets',
              event = 'CursorHold',
            },
          },
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/Cmp-path',
        'hrsh7th/cmp-buffer',
      },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufRead',
    config = function()
      require('brunocroh.plugins.lsp.null-ls')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertCharPre',
    after = 'nvim-cmp',
    config = function()
      require('brunocroh.plugins.pairs')
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('brunocroh.plugins.mason')
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('brunocroh.plugins.mason-lspconfig')
    end
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('brunocroh.plugins.fidget')
    end
  },

  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})

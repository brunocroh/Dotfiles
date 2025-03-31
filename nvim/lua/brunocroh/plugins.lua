require("lazy").setup({
  "mfussenegger/nvim-jdtls",
  "f-person/git-blame.nvim",
  "airblade/vim-gitgutter",
  "tpope/vim-fugitive",
  "folke/which-key.nvim",
  'kabouzeid/nvim-lspinstall',
  'easymotion/vim-easymotion',
  "tpope/vim-surround",
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('brunocroh.plugins.harpoon')
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    "brunocroh/open-link.nvim",
    -- dev = true,
    config = function()
      require('open-link').setup({
        -- browserCmd = { '/usr/bin/open', '-a', '/Applications/Firefox.app/' }
      })

      vim.keymap.set({ "v" }, "<leader>go", "<cmd>OpenLink<cr>", { desc = "Open link in the browser" })
    end,
  },
  {
    -- "frankroeder/parrot.nvim",
    "/brunocroh/plugins/parrot.nvim",
    dev = true,
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    config = function()
      require('brunocroh.plugins.parrot')
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
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
  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
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
    'numToStr/Comment.nvim',
    opts = {
    }
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
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
  {
    {
      'nvim-telescope/telescope.nvim',
      event = 'CursorHold',
      lazy = true,
      dependencies = {
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require('brunocroh.plugins.telescope')
      end,
    },
  },
  -- Code completion --
  {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_leader_key = ','
      vim.g.user_emmet_settings = {
        indent_blockelement = 1,
      }
    end,
  },
  {
    'haorenW1025/completion-nvim',
    opt = true,
    dependencies = {
      { 'hrsh7th/vim-vsnip',       opt = true },
      { 'hrsh7th/vim-vsnip-integ', opt = true }
    }
  },
  -- LSP --
  --
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
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
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
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
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require('brunocroh.plugins.lsp.conform')
    end,
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      require('brunocroh.plugins.rust-tools')
    end
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
  { "folke/neoconf.nvim",                       cmd = "Neoconf" },
  "folke/neodev.nvim",
})

return {
  {
    "stevearc/oil.nvim",
    enabled = not vim.g.vscode,
    cmd = "Oil",
    lazy = false,
    opts = {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<Esc><Esc>"] = {
          "actions.close",
          mode = "n",
        },
        ["<leader>e"] = "actions.parent",
      },
      float = {
        max_width = 0.7,
        max_height = 0.6,
        border = "rounded",
        preview_split = "right",
        win_options = {
          winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,FloatTitle:TelescopeTitle",
        },
      },
      preview_win = {
        win_options = {
          winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,FloatTitle:TelescopeTitle",
        },
      },
      confirmation = {
        border = "rounded",
        win_options = {
          winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder,FloatTitle:TelescopeTitle",
        },
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Oil --float --preview<cr>",
        desc = "Open parent directory",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    cmd = "Telescope",
    enabled = not vim.g.vscode,
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
          width = 0.7,
          height = 0.6,
          prompt_position = "top",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>",                  desc = "Old Files" },
      { "<leader>fc", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",               desc = "Diagnostics" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                   desc = "Keymaps" },
      { "<leader>fr", "<cmd>Telescope resume<cr>",                    desc = "Resume" },
      { "<leader>fs", "<cmd>Telescope grep_string<cr>",               desc = "Grep String" },
      { "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search Buffer" },
    },
  },
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}

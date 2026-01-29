return {
  -- DOCS: Main color-scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        styles = {
          variables = { "italic" },
        },
        integrations = {
          notify = true,
          aerial = true,
          mason = true,
          noice = true,
          hop = true,
          markdown = true,
          indent_blankline = {
            enabled = true,
            scope_color = "mauve",
            colored_indetn_levels = true,
          }
        },
        custom_highlights = function(colors)
          return {
            ["@neorg.markup.inline_math.norg"] = { fg = colors.flamingo },
            ["@markup.quote.markdown"] = { fg = colors.mauve },
            ["@neorg.anchors.declaration.norg"] = { underline = true },
            ["@neorg.headings.1.prefix.norg"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["@neorg.headings.1.title.norg"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["@neorg.headings.2.prefix.norg"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["@neorg.headings.2.title.norg"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["@neorg.headings.3.prefix.norg"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["@neorg.headings.3.title.norg"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["@neorg.headings.4.prefix.norg"] = { fg = "#1E1E2E", bg = colors.green, bold = true },
            ["@neorg.headings.4.title.norg"] = { fg = "#1E1E2E", bg = colors.green, bold = true },
            ["@neorg.headings.5.prefix.norg"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["@neorg.headings.5.title.norg"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["@neorg.headings.6.prefix.norg"] = { fg = "#1E1E2E", bg = colors.yellow, bold = true },
            ["@neorg.headings.6.title.norg"] = { fg = "#1E1E2E", bg = colors.yellow, bold = true },
            ["@neorg.markup.verbatim.norg"] = { fg = colors.blue, bg = colors.mantle },

            ["Headline1"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["Headline2"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["Headline3"] = { fg = "#1E1E2E", bg = colors.peach, bold = true },
            ["Headline4"] = { fg = "#1E1E2E", bg = colors.green, bold = true },
            ["Headline5"] = { fg = "#1E1E2E", bg = colors.sapphire, bold = true },
            ["Headline6"] = { fg = "#1E1E2E", bg = colors.yellow, bold = true },

            -- Optional: Force the text inside to match if the plugin doesn't catch it
            -- (Usually not necessary, but keeps things consistent if you disable the plugin)
            ["@neorg.headings.1.title.norg"] = { link = "Headline1" },
            ["@neorg.headings.2.title.norg"] = { link = "Headline2" },
            ["@neorg.headings.3.title.norg"] = { link = "Headline3" },
            ["@neorg.headings.4.title.norg"] = { link = "Headline4" },
            ["@neorg.headings.5.title.norg"] = { link = "Headline5" },
            ["@neorg.headings.6.title.norg"] = { link = "Headline6" },
          }
        end,
      })

      require("lualine").setup({
        themes = "catpuccin"
      })

      vim.cmd.colorscheme("catppuccin")
      vim.cmd("highlight clear @operator.latex")
    end
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "norg" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("headlines").setup({
        norg = {
          headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
        },
      })
    end,
  },
}

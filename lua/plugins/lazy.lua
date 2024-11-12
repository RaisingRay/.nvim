local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
        {'nvim-telescope/telescope.nvim', tag = '0.1.8',dependencies = { 'nvim-lua/plenary.nvim' }},
        {"folke/tokyonight.nvim",lazy = false,priority = 1000,opts = {},},
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
        {'windwp/nvim-autopairs',event = "InsertEnter",config = true,},
        {"neovim/nvim-lspconfig"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"},
        {"hrsh7th/nvim-cmp"},
        {"L3MON4D3/LuaSnip"},
        {"saadparwaiz1/cmp_luasnip"},
        {"j-hui/fidget.nvim"},
        {"nvim-tree/nvim-tree.lua"},
        {
            "wallpants/github-preview.nvim",
            cmd = { "GithubPreviewToggle" },
            keys = { "<leader>mpt" },
            opts = {},
            config = function(_, opts)
                local gpreview = require("github-preview")
                gpreview.setup(opts)

                local fns = gpreview.fns
                vim.keymap.set("n", "<leader>mpt", fns.toggle)
                vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
                vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)
            end,
        },
        {'neovim/nvim-lspconfig'},
        {'jose-elias-alvarez/null-ls.nvim'},
})


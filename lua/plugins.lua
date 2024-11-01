return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "kyazdani42/nvim-tree.lua"
    use ("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}) 
    -- Dealing with Coq & nvim-cmp
    use {"ms-jpq/coq_nvim", branch = "coq"}
    use {"ms-jpq/coq_nvim", branch = "artifacts"}
    use 'hrsh7th/nvim-cmp'    
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer' 
    use 'hrsh7th/cmp-path'  
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'       
    use 'L3MON4D3/LuaSnip'     
    use "sainnhe/gruvbox-material"
    use 'nvim-lua/plenary.nvim'
    use "nvim-lua/telescope.nvim"
    -- auto-pairs
    use "windwp/nvim-autopairs"

    vim.g.coq_settings = {
        auto_start = "shut-up",
        clients = {
            lsp = {
                enabled = true, 
            },
        },
    }
    
    
    
    -- CMP setup    
    local cmp = require("cmp")

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For luasnip users.
            end,
        },
        
        mapping = {
                ['<C-n>'] = require("cmp").mapping.select_next_item(),
                ['<C-p>'] = require("cmp").mapping.select_prev_item(),
                ['<C-y>'] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item.
                ['<C-Space>'] = require("cmp").mapping.complete(), -- Trigger completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },

        sources = {
            { name = 'coq' },  -- Coq.nvim completion source
            { name = 'buffer' },
            { name = 'path' },
            { name = 'luasnip' },
        },
    })
    
    -- Integrate cmp with autopairs
    require("nvim-autopairs").setup{}
    -- Autopairs Configuration with cmp


    -- Nvim Tree
end)

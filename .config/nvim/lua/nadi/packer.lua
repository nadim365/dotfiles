-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Kawaii-ify Neo:
	--	use ({
	--		'rose-pine/neovim',
	--		as = 'rose-pine',
	--		config = function()
	--			vim.cmd('colorscheme rose-pine')
	--		end
	--	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	-- Tools:
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
	})
	use("nvim-lua/plenary.nvim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- LSP related Tools:
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	-- Code Completion Tools:
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("rafamadriz/friendly-snippets")
	use("nvim-tree/nvim-web-devicons")
	use("folke/neodev.nvim")

	-- Convenience Tools:
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("mhartington/formatter.nvim")
	use("mfussenegger/nvim-lint")
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			{ "mfussenegger/nvim-dap" },
			{ "nvim-neotest/nvim-nio" },
		},
	})
	use({
		"OXY2DEV/markview.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- Async neovim IO library:
	--use({ "nvim-neotest/nvim-nio" })
	-- Platform Specific Tools:
	use("hsanson/vim-android")

	-- Neovim Pretty looking Dashboard
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				theme = "hyper",
				config = {
					header = {
						[[                                       ,▄▄▄▄▄▄▄▄,_                                    ]],
						[[                                   ▄▓███▀▀▓██▓▀▀███▓▄                                 ]],
						[[                                ,▓██▀"  ▓███████  '▀███╥                              ]],
						[[                               ▓██"    ▓█████████    '▀██                             ]],
						[[                              ██▀ _,╓_ ╟█████████ _,,_ ╙██                            ]],
						[[                             ██▌▄██████▓╙██████▀▓██████▌╙██                           ]],
						[[                            ╒██╫█████████  ██M ████████████▌                          ]],
						[[                            ▐██╟█████████  ██M ╟█████████╫█▌                          ]],
						[[                            "██ ╙████████▄ ██M▄████████▀ ██▌                          ]],
						[[                             ██▌       └▀███████"       ▐██                           ]],
						[[                              ██▌         ▀███"        ▄██"                           ]],
						[[                               ▀██▄        ██M       ,███                             ]],
						[[                                `▀██▄,     ██M    _▄██▀┘                              ]],
						[[                                   ╙▀███▓▄▄██▄▄▓███▀▀                                 ]],
						[[                                       └╙▀▀▀▀▀▀╙└                                     ]],
						[[          _╓▄▄▄   ,▄▄▄▄▄▄▄▄▄,    ,▄▄▄_       ╓▄▄▄      ╓▄▄▄   ,▄▄   ,▄▄▄▄_▄▄▄▄        ]],
						[[        ▄███████▓_▐██████████▌╓████████▄ ____╫████▌ ╓███████▓,╫██▄▓███▀████████▄      ]],
						[[       ▐██Ñ    ███▐██▄     ▀▀▀██▌    ╟██M ╙████▄_  ▐██Ñ    ╟██▓████▀─ ███`   ╙██▌     ]],
						[[       ╙██▄    ▐██▐████▓▄     ██▌_   ▐██N██L ╙▀███▄J██▄    ▐██╠████▄, ███,    ██▌     ]],
						[[        ╙██████▐██'╙╙"▀████▄  '▀█████▐██M███████████╙██████▐██╙╙╙└▀███▓██████▌██▌     ]],
					},
					shortcut = {
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope",
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
					},
					packages = { enable = true },
					footer = {
						[[                                                                    ]],
						[[                                                                    ]],
						[[                                                                    ]],
						[[                                                                    ]],
						[[   _____       ___                _       __  ___                   ]],
						[[  / __(_)___  / _ \___ ______  __(_)__   /  |/  /__ ____ ____  ___ _]],
						[[ _\ \/ / __/ / ___/ _ `/ __/ |/ / (_-<  / /|_/ / _ `/ _ `/ _ \/ _ `/]],
						[[/___/_/\__/ /_/   \_,_/_/  |___/_/___/ /_/  /_/\_,_/\_, /_//_/\_,_/ ]],
						[[                                                   /___/            ]],
						[[                                                                    ]],
						[[                                                                    ]],
					},
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
end)

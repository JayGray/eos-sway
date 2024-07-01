return {
    {
        "haydenmeade/neotest-jest",
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-treesitter/nvim-treesitter", "haydenmeade/neotest-jest" },
        opts = function(_, opts)
            table.insert(
                opts.adapters,
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "jest.config.js",
                    cwd = function()
                        return vim.fn.getcwd()
                    end,
                })
            )
        end,
    },
}

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local conditional = function(fn)
    local utils = require("null-ls.utils").make_conditional_utils()
    return fn(utils)
end

null_ls.setup({
    debug = false,
    -- the sources are prettier, eslint_d and rubocop
    sources = {
        --[[ formatting.prettier.with({ ]]
        --[[     condition = function(utils) ]]
        --[[         return utils.root_has_file({ '.prettierrc', '.prettierrc.js', 'prettierrc.json' }) ]]
        --[[     end ]]
        --[[ }), ]]

        -- setting eslint_d only if we have a ".eslintrc.js" file in the project
        diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc', '.eslintrc.js', '.eslintrc.json' })
            end
        }),
        formatting.eslint_d.with({
            condition = function(utils)
                local has_eslint = utils.root_has_file({ '.eslintrc', '.eslintrc.js', '.eslintrc.json' })
                --[[ local has_prettier = utils.root_has_file({ '.prettierrc', '.prettierrc.js', 'prettierrc.json' }) ]]
                --[[ return has_eslint and not has_prettier ]]
                return has_eslint
            end
        }),
        formatting.autopep8,
    }
})

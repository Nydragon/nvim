
vim.g.ale_fixers = {
    ['*'] = {
        'remove_trailing_lines',
        'trim_whitespace'
    },
    ["lua"] = {
        "lua-format"
    },
    ["rust"] = {
        "rustfmt"
    }
}


vim.g.ale_fix_on_save = 1

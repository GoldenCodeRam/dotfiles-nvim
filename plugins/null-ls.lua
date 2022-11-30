local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local b = null_ls.builtins

local sources = {
    -- webdev stuff
    b.formatting.prettier,

    -- Lua
    b.formatting.stylua,

    -- Python
    b.formatting.black,

    -- Prisma
    b.formatting.prismaFmt.with {
        command = "npx",
        args = {
            "prisma",
            "format",
            "--schema",
            "$FILENAME",
        },
        filter = function(diagnostic)
            return false
        end,
    },

    -- Shell
    b.formatting.shfmt,
    b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
    debug = true,
    sources = sources,
}

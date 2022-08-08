local utils = require("gio.autocomands")

utils.define_augroups({
    _general_settings = {
        {'BufWinEnter', '*', 'setlocal formatoptions-=r formatoptions-=o'},
        {'BufRead', '*', 'setlocal formatoptions-=r formatoptions-=o'},
        {'BufNewFile', '*', 'setlocal formatoptions-=r formatoptions-=o'},
        {'FocusLost, WinLeave', '*', 'wall'},
        {'BufWritePre', '*', '%s/\\s\\+$//e'},
        {'BufReadPre', '*', 'filetype plugin indent on'},
        {'BufWritePost', 'plugin.lua', 'source <afile> | PackerCompile'},
    },
})

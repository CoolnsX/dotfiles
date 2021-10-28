set number
set relativenumber
set shiftwidth=4

call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

let g:lightline = {'colorscheme': 'monokai_tasty',}

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

hi Normal guibg=NONE ctermbg=NONE

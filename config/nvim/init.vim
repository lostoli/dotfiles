" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let mapleader=" "
let g:mapleader=" "
let maplocalleader=" "
set t_Co=256
set background=dark
colorscheme underwater 
set encoding=utf8
set spelllang=en_gb

let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'

let g:deoplete#auto_complete_start_length = 1 
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>") 
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Neosnippet directory.
let g:neosnippet#snippets_directory='~/.config/nvim/snippits'

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.config/nvim/snippits/tex.snippits'

if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
                        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
                        \ . '|hyperref\s*\[[^]]*'
                        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ .')'


let g:airline_powerline_fonts = 1
let g:airline_theme='alduin'

"fast save
map <leader>w :w<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose
map <leader>t :tabnext<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" indenting
set tabstop=8     
set expandtab    
set shiftwidth=4
set autoindent

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
        let string=a:string
        " Escape regex characters
        let string = escape(string, '^$.*\/~[]')
        " Escape the line endings
        let string = substitute(string, '\n', '\\n', 'g')
        return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
        " Save the current register and clipboard
        let reg_save = getreg('"')
        let regtype_save = getregtype('"')
        let cb_save = &clipboard
        set clipboard&

        " Put the current visual selection in the " register
        normal! ""gvy
        let selection = getreg('"')

        " Put the saved registers and clipboards back
        call setreg('"', reg_save, regtype_save)
        let &clipboard = cb_save

        "Escape any special characters in the selection
        let escaped_selection = EscapeString(selection)

        return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>r <Esc>:%s/<c-r>=GetVisual()<cr>/
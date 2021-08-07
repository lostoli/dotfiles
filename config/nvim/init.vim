call plug#begin('~/.local/share/nvim/plugged')
"Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Misc
Plug 'junegunn/fzf.vim'
Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'jiangmiao/auto-pairs'
Plug 'tmsvg/pear-tree'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Python
Plug 'hdima/python-syntax'
Plug 'tell-k/vim-autopep8'

" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'neovimhaskell/haskell-vim'

" Latex
Plug 'lervag/vimtex'

" Markdown
Plug 'masukomi/vim-markdown-folding' 

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colors
Plug 'rafi/awesome-vim-colorschemes' 
Plug 'ajgrf/parchment'
Plug 'altercation/vim-colors-solarized' 
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'relastle/bluewery.vim'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryuta69/elly.vim'
"
" Plug 'flazz/vim-colorschemes'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'neomake/neomake'
" Plug 'dhruvasagar/vim-table-mode'
call plug#end()

let mapleader=" "
imap jk <ESC>
tnoremap jk <C-\><C-n>
inoremap <C-s> <C-\><C-o>:w<CR>
let g:mapleader=" "
let maplocalleader=" "
if has("termguicolors")
    set termguicolors
endif
" set t_Co=256
" let g:airline_theme='ayu_mirage'
" let g:airline_theme='nord'
let g:airline_theme='papercolor'
" let g:solarized_termcolors=256
set background=light
colorscheme PaperColor 
" let ayucolor="light" 
" colorscheme ayu
" colorscheme elly
autocmd ColorScheme * highlight! Normal ctermbg=NONE 
autocmd ColorScheme * highlight! VertSplit ctermbg=NONE ctermfg=NONE 
autocmd ColorScheme * highlight! StatusLineNC ctermbg=15 ctermfg=15 
autocmd ColorScheme * highlight! FoldColumn ctermbg=NONE ctermfg=NONE 
autocmd ColorScheme * highlight! LineNr ctermbg=NONE ctermfg=NONE 
" hi Normal ctermbg=NONE
" hi VertSplit ctermbg=7 ctermfg=7
" hi StatusLineNC ctermbg=7 ctermfg=7
set encoding=utf8
set spelllang=en_gb
set cursorline
set foldmethod=marker
set textwidth=78
set relativenumber
set scrollback=450

syntax on
filetype plugin indent on

autocmd FileType python set equalprg=autopep8\ -
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR>
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2

""""vim-haskell config""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_case = 2
""""""""""""""""""""""""""""""""""""

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:tex_comment_nospell=1
let g:vimtex_quickfix_enabled=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc-confi"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>qf <Plug>(coc-fix-current)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc-plugins

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'gutter':  ['bg', 'Normal'],
  \ 'info':    ['fg', 'CursorLine'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'CursorLine'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
""""""""""""""""""""""""""""""""""""""""""""""

"fast save
map <leader>w :w<cr>

"fast unhighlight
map <leader>n :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :enew<cr>
map <leader>to :tabonly<cr>
map <leader>bc :bp <BAR> bd #<CR>
map <leader>t :vsp<cr>:terminal<cr>

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
map <leader>s  ]sz=
map <leader>.  <C-W><C-W>
map <leader>o :Files<cr>
map <leader>b :Buffers<cr>
map <leader>c :Colors<cr>
map <leader>/ :Rg<cr>
map <leader>h :%!/home/oli/.local/bin/stylish-haskell<cr>
map <leader>l :Lines<cr>

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

map <leader>0 :set rnu!<cr>

" indenting
set tabstop=4     
set expandtab    
set shiftwidth=4
set autoindent

" insert newline at cursor
nnoremap <C-J> a<CR><Esc>

" cursorline options:
set cursorline 
" hi CursorLine  cterm=NONE ctermbg=15 ctermfg=0 
hi CursorLine  cterm=NONE ctermbg=225

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

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

""""Disable arrow keys!""""
noremap <Down> <Nop>
noremap <Left> :bprevious<cr>
noremap <Right> :bnext<cr>
noremap <Up> <Nop>

" noremap! <Down> <Nop>
" noremap! <Left> <Nop>
" noremap! <Right> <Nop>
" noremap! <Up> <Nop>

au BufRead,BufNewFile *.lucius set filetype=css
au BufRead,BufNewFile *.julius set filetype=javascript
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

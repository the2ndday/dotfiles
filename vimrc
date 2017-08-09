set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"==========================
" Plug ins
call plug#begin('~/.vim/plugged')

"syntax
Plug 'mustache/vim-mustache-handlebars'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'

"coding
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/neocomplete.vim'

" note
Plug 'vitalk/vim-simple-todo'
Plug 'junegunn/goyo.vim'

"navigate/search/undo/yank
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'mileszs/ack.vim'
Plug 'goldfeld/vim-seek'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

"git
Plug 'tpope/vim-fugitive'

"vim
Plug 'takac/vim-commandcaps'

"color
Plug 'ajh17/Spacegray.vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

"==========================
" basic Setup
set shortmess+=I
set encoding=utf-8

"==========================
" color
set t_Co=256
set background=light
colorscheme solarized
" colorscheme spacegray
" for solarized
if (g:colors_name =~ "solarized")
    "let g:solarized_termcolors=256
    autocmd ColorScheme * hi Normal ctermbg=015
    autocmd ColorScheme * hi LineNr ctermfg=253 ctermbg=none cterm=none
    autocmd ColorScheme * hi CursorLine ctermbg=255 cterm=none
    autocmd ColorScheme * hi CursorColumn ctermbg=255 cterm=none
    autocmd ColorScheme * hi StatusLine ctermfg=254 ctermbg=237
    autocmd ColorScheme * hi StatusLineNC ctermfg=254 ctermbg=248
    autocmd ColorScheme * hi VertSplit ctermfg=254 ctermbg=254 cterm=none
    autocmd ColorScheme * hi Search ctermbg=230 cterm=none
    autocmd ColorScheme * hi Comment ctermfg=248 ctermbg=231 cterm=none
endif


"==========================
" interface
set cursorline
:au WinEnter * :setlocal cursorline
:au WinLeave * :setlocal nocursorline

set modelines=0
set scrolloff=4
set wrap
set noshowmode
set ttyfast
let loaded_matchparen = 1 "turn off matching parenthesis highlighting

"==========================
" status bar
set statusline=%F
set statusline+=%M\ 
"read only flag
set statusline+=%R\ 
"help file flag
set statusline+=%H\ 
"left/right separator
set statusline+=%=
"percent through file
set statusline+=%P

set laststatus=2
set visualbell
set noerrorbells
set title

"==========================
" leader key
let mapleader = ","
nmap ; :

"==========================
" cursor and window move
nmap k gk
nmap j gj
vmap k gk
vmap j gj
nmap 0 ^
vmap 0 ^
nmap <CR> o
imap jj <ESC>
imap <C-z> <ESC><C-z>
nmap gs :vertical wincmd f<CR>

"==========================
" syntax and filetype
filetype plugin indent on
syntax enable
"show trailing whitespace
hi ExtraWhitespace ctermbg=255
match ExtraWhitespace /\s\+$/
"remove all trailing whitespace
map <leader>w :%s=\s\+$==<CR>
" filetypes
autocmd BufRead,BufNewFile *.css.erb setlocal filetype=css
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown

"==========================
" files
if has("wildmenu")
  set wildmenu
  set wildmode=longest,list
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
endif
set directory=~/.vim/temp/

"==========================
" window,file and buffer
au VimResized * exe "normal! \<c-w>="
set splitright splitbelow
set autoread

"==========================
" Coding and writing
"Zen coding
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1
"Supertab
" let g:SuperTabDefaultCompletionType = 'context'
"comment
map <leader>/ gcc
"closetag
let g:closetag_html_style=1
"goyo
map <leader>g <ESC>:Goyo<CR>
"autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"==========================
" spaces, tab, indentation, paste mode
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set copyindent
"in visual mode, go back to the selection adter indenting
vmap < <gv
vmap > >gv
"paste mode on/off
nmap <leader>p :setlocal paste! paste?<cr>

"==========================
" backup and swapfile
set noswapfile
set nobackup
set history=1000
set undolevels=1000

"==========================
" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
map <C-_> :%s/\v
map ? ?\v
map / /\v
" search highlight on/off
nmap <space> :set hlsearch! hlsearch?<CR>
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

"==========================
" simple todo
let g:simple_todo_tick_symbol = 'x'

"==========================
" open or source .vimrc
cnoreabbrev rc e ~/.vimrc
cnoreabbrev src source ~/.vimrc

"==========================
" yankring and copy
set hidden
"copy line without line breaks
nmap YY ^yg_
let g:yankring_manual_clipboard_check = 0
let g:yankring_history_dir = "~/.vim"

"==========================
" undo/redo
nmap U <C-r>
map <leader>u :GundoToggle<CR><ESC><C-w>=
imap <leader>u <ESC>:GundoToggle<CR><ESC><C-w>=

"==========================
" Directory, file, and buffer navigation
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
map <C-b> <ESC>:Buffers<CR>
imap <C-b> <ESC>:Buffers<CR>
imap <C-t> <ESC>:Files<CR>
map <C-t> <ESC>:Files<CR>
map <C-f> :Ag<CR>
imap <C-f> <ESC>:Ag<CR>
"Change current directory to the directory of the file in buffer
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>
"VimFiler
map <leader>n :VimFilerExplorer<cr>
imap <leader>n <ESC>:VimFilerExplorer<cr>
"turn off safe mode
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })
"swap behavior of o and enter
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
      \ "\<Plug>(vimfiler_expand_tree)",
      \ "\<Plug>(vimfiler_edit_file)")

autocmd FileType vimfiler nmap <silent><buffer><expr> o vimfiler#smart_cursor_map(
      \ "\<Plug>(vimfiler_cd_file)",
      \ "\<Plug>(vimfiler_edit_file)")

let g:vimfiler_ignore_pattern = [
            \ '^\.',
            \ '^Notes & Settings',
            \]


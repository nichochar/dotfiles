call pathogen#infect()

" syntax on
filetype indent on
filetype plugin indent on

" This is a big one, remap : for ;
nnoremap ; :

"set cursorline          " highlight current line, much slowness
set wildmenu            " visual autocomplete for command menu

set ttyfast
set encoding=utf-8
set nowrap
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set number
set lazyredraw          " redraw only when you need to
set ttyfast
set shiftwidth=4
set showmatch           " show matching parentheses
set ignorecase          " for searching
set smartcase           " if caps in search, use

set hlsearch            " highlight search terms
set incsearch           " show searches as you type

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
set visualbell " dont beep

set nobackup
set noswapfile
set splitright

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " make spaces and tabs visible
autocmd filetype html,xml,sql set listchars-=tab:>. " dont show spaces for these filetypes
autocmd filetype sql set listchars-=trail:. " dont show trailing whites for these filetypes

" Autocasting filetypes
autocmd BufNewFile,BufRead *.pp set ft=java
autocmd BufNewFile,BufRead *.html,*.shtml,*.stm,*.nunjucks set ft=jinja
autocmd BufNewFile,BufRead *.ql set ft=sql

autocmd filetype yaml set shiftwidth=2


" Persistent undo/redo
let undo_dir = "~/.vim/undodir"
execute "silent ! mkdir -p" . undo_dir
execute "silent set undodir=" . undo_dir
set undofile

" Elixir

set pastetoggle=<F2> " if i paste a hardcore html, dosnt indent like an idiot

set mouse=a " set the mouse

set clipboard=unnamed " global clipboard for the OS

nnoremap <Leader>\ :nohls<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>= <C-w>=
nnoremap <Leader><BS> <C-o>

nnoremap <Leader>] :vertical resize +15<CR>
nnoremap <Leader>[ :vertical resize -15<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" Colors
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Powerline
set laststatus=2

" Use the silversearcher Ag
set runtimepath^=~/.vim/bundle/ag

" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Command-T
let g:CommandTMaxFiles=20000
let g:CommandTMaxCacheDirectories=10
let g:CommandTInputDebounce=100 " TODO: tweak this.
let g:CommandTFileScanner='watchman'

" this is for css-colors, it's greedy if set to 0
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Python
" http://stackoverflow.com/questions/2360249/vim-automatically-removes-indentation-on-python-comments
inoremap # X<BS>#
let g:pymode_rope=0
" Using enhanced python syntax from
" https://github.com/hdima/python-syntax
let python_highlight_all = 1

" syntastic
let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Don't comppile java like an idiot
" http://stackoverflow.com/questions/15937042/syntastic-disable-automatic-compilation-of-java
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['foo', 'bar'], 'passive_filetypes': ['java'] }

" NERDTree stuff
let NERDTreeIgnore = ['\.pyc$']
map <leader>, :NERDTreeToggle<CR>

" This is for json viewing https://coderwall.com/p/faceag
map <leader>json :%!python -m json.tool

" This is for vim-less to compile less to css with leader+m
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Useful active command to kill trailing white space, more info here:
" http://www.bestofvim.com/tip/trailing-whitespace/
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" This is for quoting, unquoting words, more info here:
" http://vim.wikia.com/wiki/Simple_Macros_to_quote_and_unquote_a_word
" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>

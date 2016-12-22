call pathogen#infect()
" syntax on
filetype indent on
filetype plugin indent on

" This is a big one, remap : for ;
nnoremap ; :

set nowrap
" set tabstop=4
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set expandtab
set cursorline
set encoding=utf8
set number
set shiftwidth=4
set showmatch " show matching parentheses
set ignorecase " for searching
set smartcase " if caps in search, use

set hlsearch " highlight search terms
set incsearch " show searches as you type

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
set visualbell " dont beep

set nobackup
set noswapfile


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Only set list for certain filetypes
autocmd filetype python,ruby,javascript,css set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " make spaces and tabs visible
" autocmd filetype html,xml set listchars-=tab:>. " dont show spaces in html

" javascript linting, found on
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
" Enable jsx syntax highlighter in normal js files
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers=['eslint']

" Javascript
autocmd filetype javascript,html,jinja set shiftwidth=2
set pastetoggle=<F2> " if i paste a hardcore html, dosnt indent like an idiot

set mouse=a " set the mouse

set clipboard=unnamed " global clipboard for the OS

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" this is for css-colors
let g:cssColorVimDoNotMessMyUpdatetime = 1

" syntastic
let g:syntastic_python_checkers=['flake8']

" http://stackoverflow.com/questions/2360249/vim-automatically-removes-indentation-on-python-comments
inoremap # X<BS>#

" NERDTree stuff
let NERDTreeIgnore = ['\.pyc$']
map <leader>p :NERDTreeToggle<CR>

" This function allows to do a google search WOOT
function! Google()
   call inputsave()
   let searchterm = input('Google: ')
   call inputrestore()
   return searchterm
endfunction
map <leader>g <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Google()<CR>'<CR><CR>

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
" double quote a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Ag
set runtimepath^=~/.vim/bundle/ag


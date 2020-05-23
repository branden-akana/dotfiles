
" automatic vim-plug installation

if has('unix') && empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('win32') && empty(glob('$HOME/.vim/autoload/plug.vim'))
	silent ! powershell New-Item -ItemType Directory -Force
		\ -Path "$HOME/.vim/autoload"
	silent ! powershell Invoke-WebRequest
		\ -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		\ -OutFile "$HOME/.vim/autoload/plug.vim"
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let $LANG = 'en_US'

" have colors work correctly in ConEmu / cmder

"if !has("gui_running")
	"set term=xterm
	"set t_Co=256
	"let &t_AB="\e[48;5;%dm"
	"let &t_AF="\e[38;5;%dm"

	"inoremap <Char-0x07F> <BS>
	"nnoremap <Char-0x07F> <BS>
"endif

" set termguicolors
set notermguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"===============================================================================
" Core Settings
"===============================================================================

set number numberwidth=5
set relativenumber

set backspace=indent,eol,start " have backspace behave like most programs

" status line settings
" -------------------

" Always show Statusbar

set laststatus=2

set statusline=%=%m\ %c\ %P\ %f

set showtabline=2

set nocompatible              " be iMproved, required

" Remove delay after leaving Normal mode
set timeoutlen=1000 ttimeoutlen=0

set cmdheight=1 " set height of command line

set showmode
"set noshowmode  " hide mode display (for lightline)

set noswapfile

set noreadonly " always overwrite

" Disable matching parentases highlighter (optimization)

"function! g:DisableMatchParen()
	"if exists(":NoMatchParen")
		":NoMatchParen
	"endif
"endfunction

"augroup plugin_initialize
	"autocmd!
	"autocmd VimEnter * call DisableMatchParen()
"augroup END

let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20

"===============================================================================
" Editor Settings
"===============================================================================

set nowrap      " don't wrap text

set list " show invisible characters
set listchars=tab:>\ ,trail:~,extends:>,precedes:<

set hidden " don't unload buffers when closing

set colorcolumn=81 " display line ruler

"===============================================================================
" Tab Settings
"===============================================================================

set tabstop=4
set shiftwidth=4
set noexpandtab " use tabs instead of spaces

"===============================================================================
" Plugin Settings
"===============================================================================

let g:wintabs_ui_modified = '*'
let g:wintabs_ui_sep_leftmost = ' '
let g:wintabs_ui_sep_rightmost = ' '

let g:wintabs_ui_active_left = '['
let g:wintabs_ui_active_right = ']'

let g:wintabs_ui_active_vimtab_left = '['
let g:wintabs_ui_active_vimtab_right = ']'

" Linter Settings
" ---------------

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 200

"let g:ale_lint_on_save = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'typescript': ['eslint', 'tsserver'],
	\ }

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

call plug#begin('~/.vim/plugged')

"---- Plugin List --------------------------------------------------------------

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Plug 'mhinz/vim-startify'

" Git Plugins
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Show tabs
Plug 'zefei/vim-wintabs'

" Statusline Plugins
Plug 'itchyny/lightline.vim'
"Plug 'bling/vim-bufferline'
"Plug 'mgee/lightline-bufferline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Tree view
Plug 'scrooloose/nerdcommenter' " Comment toggler
"Plug 'kshenoy/vim-signature'
"Plug 'jacquesbh/vim-showmarks'

" Tag Manager
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Autocomplete Plugins
"Plug 'Valloric/YouCompleteMe'
"Plug 'ajh17/VimCompletesMe'
"Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'davidhalter/jedi-vim'
Plug 'xavierd/clang_complete'
let g:clang_library_path='D:\libs\LLVM\lib'

" Syntax Plugins
"Plug 'vim-syntastic/syntastic' " syntax linting
"Plug 'w0rp/ale' " syntax linting

Plug 'tmux-plugins/vim-tmux',    { 'for': 'tmux.conf' } " .tmux.conf syntax
Plug 'sudar/vim-arduino-syntax', { 'for': 'ino' }  " .ino syntax
"Plug 'othree/yajs.vim'

Plug 'leafgarland/typescript-vim' " typescript syntax
Plug 'pangloss/vim-javascript'    " javascript syntax
Plug 'digitaltoad/vim-pug'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'stevearc/vim-arduino',     { 'for': 'ino' }

"Plug 'maximbaz/lightline-ale'

" Colorschemes
Plug 'ajmwagar/vim-deus'
Plug 'h3xx/vim-late_evening'
Plug 'morhetz/gruvbox'

" Misc Plugins

"Plug 'szymonmaszke/vimpyter'
"Plug 'zefei/vim-colortuner', { 'on': 'Colortuner' } " adds color sliders

" ------------------------------------------------------------------------------

call plug#end()            " required

"===============================================================================
" Syntax Settings
"===============================================================================

set formatoptions-=ro " don't insert after hitting <Enter> or hitting 'o' or 'O'

syntax on
"syntax sync fromstart " always parse syntax from start of file; might be slow
syntax sync minlines=200
set synmaxcol=200

set nolazyredraw " allegedly makes drawing faster
set ttyfast
set regexpengine=1


set bg=dark " tells vim to use dark variants of colors

let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_termcolors=16
colorscheme gruvbox " syntax theme

" harder contrast
"highlight Normal     guibg='#111314'
"highlight SignColumn guibg='#111314'
"highlight ALEErrorSign   guibg='#111314' guifg='#ff6060'
"highlight ALEWarningSign guibg='#111314' guifg='#ffff00'

if !exists('g:gui_oni')
	hi Normal     guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
endif

let g:javascript_plugin_jsdoc = 1

"===============================================================================
" Fold Settings
"===============================================================================

set foldmethod=manual
set foldcolumn=0
set foldnestmax=1
set foldlevel=2

"===============================================================================
" (Plugin) Lightline Settings
"===============================================================================

filetype plugin indent on    " required

""Bufferline config
"let g:bufferline_echo = 0

"" Lightline Config {{{

"let g:lightline#bufferline#show_number  = 1
"let g:lightline#bufferline#shorten_path = 0
"let g:lightline#bufferline#unnamed      = ''
"let g:lightline#bufferline#modified     = '*'

"let s:palette = g:lightline#colorscheme#default#palette

"let s:palette.tabline.middle = [ [ '#080808', '#303030', 232, 236 ] ]

"unlet s:palette

"let g:lightline                  = {
		"\ 'colorscheme': 'default',
		"\ }

"let g:lightline.enable = {
		"\ 'statusline': 1,
		"\ 'tabline': 1,
		"\ }

"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['tabs']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}

au FileType qf wincmd J " make split full-width

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_cpp_checkers = ['cppcheck', 'gcc']
"let g:syntastic_cpp_cppcheck_args = "--enable=all"
"let g:syntastic_aggregate_errors = 1

"===============================================================================
" NERD Plugin Settings
"===============================================================================

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

let g:NERDDefaultAlign = 'left'

function! g:FocusOnTree()
	if exists(":NERDTreeFocus")
		exec "NERDTreeFocus"
	else
		exec "NERDTree"
	endif
endfunction


"nmap <leader>e :NERDTreeToggle<cr>

"===============================================================================
" Custom Functionality
"===============================================================================

" creates missing directories on save

function! s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir=fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup BWCCreateDir
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" coc.nvim tab completion
" -----------------------

" use <tab> for trigger completion and navigate to next complete item
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"===============================================================================
" Custom Macros
"===============================================================================

let mapleader = ","

nmap <leader>f :TagbarToggle<CR>
nmap <silent> <leader>e :call FocusOnTree()<cr>
nmap <leader>t :bel split <bar> resize 16 <bar> terminal<CR>i

" close buffers without closing split
nmap <C-c> :bp\|bd #<CR>

" reload .vimrc without restarting
nmap <leader>r :so $MYVIMRC<CR>

" faster split navigation

nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

" faster split navigation in terminals

tmap <Esc> <C-\><C-n>
tmap <C-J> <C-\><C-n><C-W>j
tmap <C-K> <C-\><C-n><C-W>k
tmap <C-L> <C-\><C-n><C-W>l
tmap <C-H> <C-\><C-n><C-W>h

" automatically go into insert mode for terminals
autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif

" fast buffer switching
nnoremap <leader>b :ls<cr>:b<space>

" fast buffer deleting
nnoremap <leader>d :ls<cr>:bd<space>

" fzf macros

" fuzzy find files in the working directory (where you launched Vim from)
"nmap <leader>f :Files<cr>
" fuzzy find lines in the current file
"nmap <leader>/ :BLines<cr>
" fuzzy find an open buffer
"nmap <leader>b :Buffers<cr>
" fuzzy find text in the working directory
"nmap <leader>r :Rg
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
"nmap <leader>c :Commands<cr>

" faster buffer navigation

"nmap <Leader>1 <Plug>lightline#bufferline#go(1)
"nmap <Leader>2 <Plug>lightline#bufferline#go(2)
"nmap <Leader>3 <Plug>lightline#bufferline#go(3)
"nmap <Leader>4 <Plug>lightline#bufferline#go(4)
"nmap <Leader>5 <Plug>lightline#bufferline#go(5)
"nmap <Leader>6 <Plug>lightline#bufferline#go(6)
"nmap <Leader>7 <Plug>lightline#bufferline#go(7)
"nmap <Leader>8 <Plug>lightline#bufferline#go(8)
"nmap <Leader>9 <Plug>lightline#bufferline#go(9)
"nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>1 1gt<cr>
nmap <Leader>2 2gt<cr>
nmap <Leader>3 3gt<cr>
nmap <Leader>4 4gt<cr>
nmap <Leader>5 5gt<cr>
nmap <Leader>6 6gt<cr>
nmap <Leader>7 7gt<cr>
nmap <Leader>8 8gt<cr>
nmap <Leader>9 9gt<cr>
nmap <Leader>0 10gt<cr>



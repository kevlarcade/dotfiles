" {{{ PLUGINS
call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'                      " theme
    Plug 'vim-airline/vim-airline'              " status line
    Plug 'jeffkreeftmeijer/vim-numbertoggle'    " smart relative numbering
    Plug 'airblade/vim-gitgutter'               " show git diffs
    Plug 'jiangmiao/auto-pairs'                 " spawn matched brackets / quotes
    Plug 'scrooloose/nerdtree'                  " file browser
    Plug 'jistr/vim-nerdtree-tabs'              " file browser tabs
    Plug 'w0rp/ale'                             " linting
call plug#end()
" }}}

" {{{ PLUGIN SETTINGS

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section=''
let g:airline_detect_paste=1 " Show PASTE if in paste mode
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERDTree
nmap <silent><Leader>t :NERDTreeTabsToggle<CR> " open NERDTree with \t
let g:nerdtree_tabs_open_on_console_startup=0 " don't open NERDTree on startup

" python-mode
let g:pymode_rope = 1
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" refactoring
let g:pymode_rope_rename_bind = '<C-c>rr'
" completion
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_checkers = ["shellcheck"]
" }}}

" {{{ BEHAVIOR
set nocompatible    " avoid legacy compatibility nonsense
set path=$PWD/**    " use path vim is opened in as base directory

" menu completion options
set wildmenu        " enhanced command line completion
set wildmode=list:longest,full " complete longest match, list others
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif

" search options
set hlsearch        " highlight search
set incsearch       " highlight search results as the search is typed
set magic           " set magic on, for regular expressions
set ignorecase      " searches are not case-sensitive
set smartcase       " case sensitive search if search contains capitals

set backspace=indent,eol,start " allow backspacing over more stuff
set display+=lastline   " always display the last line of the screen
set whichwrap+=<,>,h,l  " allow cursor to wrap lines
set wrap            " soft wrap all files
set confirm         " ask to confirm instead of failing
set linebreak       " keep words whole when wrapping
set scrolloff=2     " start scrolling a few lines from the border
set visualbell      " use colour blink instead of sound
set encoding=utf8   " use utf8 as internal encoding
set hidden          " allow opening new buffers without saving changes
set mouse=a         " allow mouse control in all modes

" undo and backup
set noswapfile      " plenty of RAM, do not need swap
set nobackup        " remembering to save often
set nowritebackup   " is the best kind of backup
set undolevels=1000 " undo history to keep

" panes
set splitbelow      " open new panes on the bottom
set splitright      " open new panes on the right
" }}}

" {{{ INTERFACE
syntax on                   " enable syntax highlighting
set showmatch               " highlight matching brackets
set title                   " set window title
set scrolljump=10           " scroll jump lines
set pumheight=20            " popup menu height
set diffopt+=context:3
set nostartofline           " sticky columns when moving cursor


" line numbers
set number                  " show line numbers
set numberwidth=3           " pad number column
set colorcolumn=81,120      " highlight 81st column
" uncomment to highlight all columns beyond the 80th
" execute "set colorcolumn=" . join(range(81,335), ',')

" status line
set showcmd                 " show command in statusline
set ruler                   " show line and cursor position
set laststatus=2            " wider status line for airline
set noshowmode              " hide the default mode text
set nomodeline              " hide the default mode line
set shortmess=atToOI        " avoid prompts caused by the file messages
set updatetime=1500         " status line refresh time

" whitespace
set listchars=tab:>-,trail:·        " show tabs and trailing space
set list                            " enable the above settings
autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespace

" colours
set t_Co=256                " enable 256 colour themes
colorscheme gruvbox         " gruvbox colourscheme
set background=dark         " use dark background
" hi Normal ctermbg=none    " transparent background

set cursorline              " highlight current line
set ttyfast                 " improves redrawing for newer computers
" }}}

" {{{ FORMATTING
set tabstop=4               " width of tab character
set softtabstop=4           " how many columns the tab key inserts
set shiftwidth=4            " width of indentation levels
set expandtab               " expand tabs into spaces
set smartindent             " smart autoindenting
filetype plugin indent on   " determine indentation rules by filetype

" folding
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0
" }}}

" {{{ KEYBINDINGS
let mapleader = ' '         " use spacebar as map leader
let g:mapleader = ' '       " same-same but different

" space clears search highlights and any message displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" move lines up and down with alt + [j,k]
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" indenting
nnoremap <Tab> >>_          " increase indent with >>
nnoremap <S-Tab> <<_        " decrease indent with <<
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv          " tab to increase indent
vnoremap <S-Tab> <gv        " shift tab to decrease indent

" save file as root with space + w
noremap <Leader>W :w !sudo tee % > /dev/null

" up and down arrow keys to move between buffers
nnoremap <silent> <Down>   :bn<CR>
nnoremap <silent> <Up>  :bp<CR>

" copy visual
map <C-c> "+y<CR>

" toggle paste mode
set pastetoggle=<F2>

" NerdTree
" silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
" }}}

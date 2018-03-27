""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Kai Wu
"     https://imkaywu.github.io - kaywu@ece.ubc.ca
" Section:
"     -> General
"     -> VIM user interface
"     -> Colors and Fonts
"     -> Files and backups
""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim instead of Vi settings.
set nocompatible

" Standard encoding
set encoding=utf-8

" Store lots of :cmdline history
set history=1024

" Makes backspace behave in a sane manner.
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting
filetype plugin on
filetype indent on

" Reload files changed outside Vim
set autoread

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Flagging Unnecessary Whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 

" Access the system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Show line numbers
set number

" Show command in bottom bar
set showcmd

" Height of the command bar
set cmdheight=1

" Always show current position
set ruler

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we need to, don't redraw while executing macros.
set lazyredraw


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off backup
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Use spaces instead of tabs
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Find the next match as we type the search
set incsearch

" Highlight searches by default
set hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
map <C-r> :source ~/.vimrc<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management and Config
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" For Github repos, you specify plugins using the 'user/repository' format
" We could also add repositories with a ".git" extension

" This is the Vundle package, which can be found on Github
Plugin 'gmarik/vundle'

" Code folding
Plugin 'tmhedberg/SimpylFold'

" Auto completion
"Plugin 'Valloric/YouCompleteMe'

" Syntax checking/highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" File browsing
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'

" Super Searching
Plugin 'kien/ctrlp.vim'

" Powerline - status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
"Plugin 'Buffergator'

" Goyo distraction-free writing
Plugin 'junegunn/goyo.vim'

" Latex-Box
Plugin 'LaTex-Box-Team/LaTex-Box'

" Now we can turn on our filetype functionality back on
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Code folding: see the docstrings for the folded code
let g:SimpylFold_docstring_preview=1

" YCM: Ensure the autocomplete window goes away when done with it
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')

    execfile(activate_this, dict(__file__=activate_this))
EOF

" NERDTree
"autocmd vimenter * NERDTree

" Syntax highlighting
let python_highlight_all=1
syntax on

" Color schemes
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

call togglebg#map("<F5>") " Solarized has dark and light theme, switch between them using F5

" File browsing: hide *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Goyo
let g:goyo_width=105

" Latex-Box
let g:tex_flavor="latex"
let g:tex_fast="cmMprs"
let g:tex_conceal=""
let g:tex_fold_enabled=0
let g:tex_comment_nospell=1


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled (not sure if useful)
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

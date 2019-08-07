""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Kai Wu
"     https://imkaywu.github.io - kaywu@ece.ubc.ca
" Section:
"     -> General
"     -> VIM user interface
"     -> Colors and Fonts
"     -> Files and backups
"     -> Text, tab and indent related
"     -> Search settings
"     -> Status line
"     -> Mapping
"     -> Plugin Management
"     -> Plugin Config
"     -> Helper functions
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
set whichwrap+=<,>,h,l

" Enable file type detection and do language-dependent indenting
filetype plugin on
filetype indent on

" Reload files changed outside Vim
set autoread

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Flagging Unnecessary Whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.cpp,*cc,*.h,*.hpp match BadWhitespace /\s\+$/ 

" Return to last edit position when opening files (extremely useful)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Access the system clipboard
set clipboard=unnamed

" Add tags search path
set tags=./tags,tags;$HOME


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Show absolute and relative line numbers
set number relativenumber

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
" TODO: make it so that it can switch between a light and a dark scheme
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Color scheme
" TODO: dark schemes not working when terminal uses a light background
try
    colorscheme PaperColor "onedark, zenburn
catch
endtry

" Use light or dark background
set background=light

" Make the color scheme in tmux consistent with that of vim
set term=screen-256color


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

" Linebreak on 80 characters
set lbr
set tw=80


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
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Refresh .vimrc
noremap <leader>r :source ~/.vimrc<cr>

" Fast saving
noremap <leader>w :w!<cr>

" Fast exiting
noremap <leader>q :q<cr>
noremap <leader>Q :q!<cr>

" Fast saving and exiting
noremap <leader>W :wq<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Move up and down by paragraph
noremap [ {
noremap ] }
noremap <C-j> 23j
noremap <C-k> 23k

" Disable highlight when <leader><cr> is pressed
nnoremap <leader><cr> :noh<cr>

" Ctags related
"noremap <C-]> g<C-]>
"noremap <C-[> <C-t> " This doesn't work so well


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color scheme papercolor-theme, and zenburn
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'joshdick/onedark.vim'
"Plugin 'jnurmine/Zenburn'

" Status bar for vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Status bar for tmux
Plugin 'edkolev/tmuxline.vim'

" Automatically discover and update ctags files
Plugin 'ludovicchabant/vim-gutentags'

" Google code styles
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" Goyo distraction-free writing
Plugin 'junegunn/goyo.vim'

" Latex-Box
"Plugin 'LaTex-Box-Team/LaTex-Box'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
let g:goyo_width=105

" Latex-Box
"let g:tex_flavor="latex"
"let g:tex_fast="cmMprs"
"let g:tex_conceal=""
"let g:tex_fold_enabled=0
"let g:tex_comment_nospell=1

" Gutentags
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Install patched powerline fonts and use use one of the fonts in terminal
let g:airline_theme='papercolor'
" Populate the |g:airline_symbols| dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Automatic toggling between absolute and relative line number modes
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Automatic code formatting
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Automatic toggling between paste and normal mode (disable automated indentation)
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end

endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

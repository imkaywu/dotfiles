""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Kai Wu
"     https://imkaywu.github.io
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
" When a tag file name starts with './', the '.' is replaced with the path of the
" current file. 
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

" Use new regular expression engine. Otherwise Typescript syntax highlighting
" will be painfully slow
set re=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Color scheme
" TODO: dark schemes not working when terminal uses a light background
try
    colorscheme PaperColor
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
set undodir=~/.vim/undodir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


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
command! W w !sudo tee % > /dev/null

" Open file (there is an invisible trailing whitespace)
noremap <leader>e :e 

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

" FZF
" File finder
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>
" Buffer finder
nnoremap <leader>b :Buffers<CR>
" Tag finder
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>
" Line finder
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>' :Marks<CR>
" Project finder (Install the Silver Searcher or ripgrep)
nnoremap <leader>/ :Ag<CR>
nnoremap <leader>/ :Rg<CR>
" Fuzzy search defined commands
nnoremap <leader>C :Commands<CR>
" Fuzzy search through command history
nnoremap <leader>h :History<CR>
nnoremap <leader>h: :History:<CR>
nnoremap <leader>h/ :History/<CR>
" Fuzzy search key mappings
nnoremap <leader>M :Maps<CR>
" Fuzzy search filetype syntaxes,
nnoremap <leader>s :Filetypes<CR>
nnoremap <leader>S :Snippets<CR>
" Help Finder
nnoremap <leader>H :Helptags!<CR>

" VimWiki
nmap <Leader>tl <Plug>VimwikiToggleListItem
nmap <Leader>tn <Plug>VimwikiIncrementListItem
nmap <Leader>tp <Plug>VimwikiDecrementListItem
nmap <Leader>tx <Plug>VimwikiToggleRejectedListItem


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color scheme papercolor-theme, and zenburn
Plug 'NLKNguyen/papercolor-theme'

" Status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Status bar for tmux
Plug 'edkolev/tmuxline.vim'

" Automatically discover and update ctags files
Plug 'ludovicchabant/vim-gutentags'

" VimWiki
Plug 'vimwiki/vimwiki'

" Google code styles
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Goyo distraction-free writing
Plug 'junegunn/goyo.vim'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Emmet
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Install patched powerline fonts and use one of the fonts in terminal
let g:airline_theme='papercolor'
" Populate the |g:airline_symbols| dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Gutentags
set statusline+=%{gutentags#statusline()}
" A list of project root marker that determines if a file should be managed by
" Gutentags.
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" Exclude file types and directories.
" https://pavelespinal.com/short-articles/vim-gutentags-ignoring-exclude-parameters-from-ctags/
let g:gutentags_ctags_exclude = ['*.go', '*/build/*']
" The tag file that Gutentags creates and manages.
let g:gutentags_ctags_tagfile = '.tags'
" Specifies a directory in which to create all the tags files, instead of
" writing them at the root of each project.
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" Ctags related configurations
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" Print debug information
let g:gutentags_trace = 0

" FZF
" Always enable preview window on the top with 40% height.
let g:fzf_preview_window = ['up:40%', 'ctrl-/']
" Rg would NOT consider filename as a match in Vim.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" VimWiki
let g:vimwiki_global_ext = 0
let g:vimwiki_ext2syntax = {}
let g:vimwiki_listsyms = ' .oOX'
let wiki_1 = {'path': '~/Documents/git-repos/bullet-journal/game-dev', 'syntax': 'markdown', 'ext': 'md'}
let wiki_2 = deepcopy(wiki_1)
let wiki_2.path = '~/Documents/git-repos/bullet-journal/2023'
let wiki_3 = deepcopy(wiki_1)
let wiki_3.path = '~/Documents/git-repos/bullet-journal/2024'
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

" Goyo
let g:goyo_width=105

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_fmt_command = "gofmt"     " autoupdate import
let g:go_fmt_autosave = 1          " autosave on updates

" Emmet
let g:user_emmet_leader_key='<C-M>'


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

" Automatic set paste mode when pasting in insert mode using bracketed paste 
" mode of the terminal emulator. (disable automated indentation)
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
endfunction

map <expr> <Esc>[200~ XTermPasteBegin("i")
imap <expr> <Esc>[200~ XTermPasteBegin("")
vmap <expr> <Esc>[200~ XTermPasteBegin("c")
cmap <Esc>[200~ <nop>
cmap <Esc>[201~ <nop>

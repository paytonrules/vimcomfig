filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim

" F vi set nocompatible
set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on

set lazyredraw
set t_Co=256

" completion on the command line
set wildmenu

" numbered lines
set number
set nohlsearch
set nopaste

" no beeps
set vb

" Get rid of goofy buttons
set guioptions=ac

let mapleader = ","

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent

set incsearch

" I'm so nice to Windoze
set shellslash
set nowrap

set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [ASCII=\%03.3b]\ [Format=%{&ff}]\ [Type=%y]
set laststatus=2

" add pathogen managed plugins
call pathogen#incubate()

noremap <Leader>d :r !date<CR>
iabbrev @@ esmith@8thlight.com
iabbrev ww www.paytonrules.com
iabbrev quesiton question

" recreate ctags
noremap <Leader>ct :!/usr/local/bin/ctags -R .<CR>

" Edit or load .vimrc
noremap <silent> ,ev :vsplit $MYVIMRC<CR>
noremap <silent> ,sv :so $MYVIMRC<CR>

" Format xml on the fly
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Toggle paste mode (indent weirdness)
nnoremap <silent> ,p :set paste!<CR>:set paste?<CR>

" Toggle highlighted search
nnoremap <silent> ,n :set hls!<CR>:set hls?<CR>

" Toggle word wrapping
nnoremap <silent> ,w :set wrap!<CR>:set wrap?<CR>

" cd to directory of the current file
noremap <silent> ,cd :lcd %:h<CR>

" Move the cursor to the window in the proper direction
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Close the window in the proper direction
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Move the current window to the proper direction from the main Vim window
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Tab navigation
noremap <silent> ,] :tabnext<CR>
noremap <silent> ,[ :tabprevious<CR>

noremap <silent> ,t :CtrlP<CR>

" XCode build
noremap <silent> ,b :!xctool<CR>

noremap <silent> ,ms :mksession! session.vim<CR>

let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$']
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

autocmd FileType clojure setlocal lispwords+=describe,it,context,around
autocmd FileType clojure setlocal wildignore+=target/**/*

autocmd BufNewFile,BufReadPost *.feature,*.story set filetype=cucumber
autocmd BufNewFile,BufReadPost *.clj,*.cljs,*.hiccup set filetype=clojure
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.html,*.textile,*.markdown,*.md set linebreak wrap
autocmd BufNewFile,BufReadPost *.ejs set filetype=html
autocmd BufNewFile,BufReadPost *.coffee set filetype=coffee
autocmd QuickFixCmdPost *grep* cwindow
autocmd BufWritePre * :%s/\s\+$//e

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

colorscheme jellybeans

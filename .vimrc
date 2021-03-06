" add pathogen managed plugins
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" F vi set nocompatible
set nocompatible
filetype plugin indent on
syntax on

set lazyredraw
set t_Co=256
set exrc
set secure

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

noremap <Leader>d :r !date<CR>
iabbrev @@ esmith@8thlight.com
iabbrev ww www.paytonrules.com
iabbrev quesiton question

" recreate ctags
noremap <Leader>ct :!/usr/local/bin/ctags -R .<CR>

" Edit or load .vimrc
noremap <silent> ,ev :vsplit $MYVIMRC<CR>
noremap <silent> ,sv :so $MYVIMRC<CR>

" Edit todo list
noremap <silent> ,d :vsplit ~/Dropbox/todolist/todos.otl<CR>

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

let NERDTreeIgnore=['\.vim$', '\~$', '\.o$']

autocmd FileType clojure setlocal lispwords+=describe,it,context,around,should-invoke,should-not-invoke
autocmd FileType clojure setlocal wildignore+=target/**/*

autocmd BufNewFile,BufReadPost *.feature,*.story set filetype=cucumber
autocmd BufNewFile,BufReadPost *.clj,*.cljs,*.hiccup,*.cljx set filetype=clojure
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.html,*.textile,*.markdown,*.md set linebreak wrap
autocmd BufNewFile,BufReadPost *.ejs set filetype=html
autocmd BufNewFile,BufReadPost *.coffee set filetype=coffee
autocmd QuickFixCmdPost *grep* cwindow
autocmd BufWritePre * :%s/\s\+$//e

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_disabled_filetypes=['go']

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

colorscheme jellybeans

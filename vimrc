set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'PhilRunninger/nerdtree-buffer-ops'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'blueyed/vim-diminactive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
" Html CSS
Plugin 'mattn/emmet-vim'

" colorscheme
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'

" syntax Highlight
Plugin 'octol/vim-cpp-enhanced-highlight' "c++
Plugin 'vim-python/python-syntax' "python
Plugin 'pangloss/vim-javascript' "javascript
Plugin 'MaxMEllon/vim-jsx-pretty' "React jsx grammer for javscript


call vundle#end()
filetype plugin indent on

"Cursor Shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode
" reset the cursor on start (for older versions of vim, usually not required)
" reset the cursor on End / Leave
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

"Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"syntastic
"let g:syntastic_debug=2
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_checkrs=['python']

nmap <F2> : TagbarToggle<cr>
nmap <F3> : NERDTreeToggle<cr>

inoremap <expr><Tab> getline('.')[col('.')-1] =~? '[]>)}''"`]' ? '<Right>' : '<Tab>'

set termguicolors
colorscheme onedark
"colorscheme gruvbox
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_bold=0
if has("Syntax")
	syntax on
endif

autocmd FileType c set ts=4 sts=4 sw=4
autocmd FileType cpp set ts=4 sts=4 sw=4
autocmd FileType python set ts=4 sts=4 sw=4
autocmd FileType javascript set ts=4 sts=4 sw=4
autocmd FileType html set ts=2 sts=2 sw=2
autocmd FileType css set ts=2 sts=2 sw=2

set clipboard=unnamedplus
set t_Co=256
set autoindent
set completeopt=menuone,menu,longest,preview
set wildmenu
set wildmode=longest,list
set autowrite
set autoread
set showmatch
set cindent
set smartindent
set wrap
set nowrapscan
set nobackup
set noswapfile
set ruler
"set sts=4
"set softtabstop=4
"set ts=4
"set tabstop=4
"set shiftwidth=4
set sw=1
set number
set fencs=utf-8,euc-kr,cp949
set encoding=utf-8
set tenc=utf-8
set hlsearch
set ignorecase
set lbr
set incsearch
set cursorline
"set cursorcolumn
set laststatus=2
filetype indent on
set background=dark
set backspace=eol,start,indent
set history=256
set mouse=a
set listchars=tab:\|\ ,trail:•,extends:»,precedes:« "Unprintable chars mapping
set list
set vb t_vb=
set statusline=\ %<%l:%v\ [%p]%=%a\ %h%m%r\ %F\

highlight Comment term=italic cterm=italic ctermfg=4
highlight Repeat term=italic cterm=italic ctermfg=4
highlight Statement term=italic cterm=italic ctermfg=4
highlight Conditional term=italic cterm=italic ctermfg=4

au BufReadPost *
\if line("'\"") > 0 && line("'\"") <= line("$") |
\exe "norm g'\"" |
\endif

if $LANG[0]=='k' && $LANG[1]=='o'
	set fileencoding=korea
endif

"using copy paste system clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
nnoremap <space> za	" space open/closes folds
set foldmethod=indent   " fold based on indent level


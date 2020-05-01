set nocompatible              " be iMproved, required
filetype off                  " required

"let vim users be able to reach in sub directories
set path+=**

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"languages proposition completion
Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

"colorscheme
Plugin 'morhetz/gruvbox'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"ocaml suggestion 
Plugin 'ocaml/merlin'

"ocaml suggestion trial 2
Plugin 'let-def/ocp-indent-vim'

" Track the engine for  Ultisnips.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine (Ultisnips). Add this if you want them:
Plugin 'honza/vim-snippets'

"autosave on every events, merlin check error on save by autosave on every
"events u get error check constantly
Plugin '907th/vim-auto-save'

"file system explor for vim
Plugin 'preservim/nerdtree'

"plugin to comment files
Plugin 'tpope/vim-commentary'

Plugin 'SQLComplete.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"************************************built in*********************
" Largeur de l'indentation avec <tab>
set softtabstop=2	

"show line numbers
set number

"scheme
colo desert
colo gruvbox
"recherche en live
set incsearch

" Highlight les paterns recherchés
set hlsearch

"when multiples choises create a little menu
set wildmenu

"create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

"remarque copier coller 
"vnoremap <C-c> "+y
"map <C-v> "+p
"vnoremap <C-c> "*y : let @+=@*<CR>

"able classical copy paste (sharedclipboard)
set clipboard=unnamedplus

"******************************** end of built int*****************

"*************************************** merlin related********************
"working merlin path
"not that merlin but must installed with opam so install opam 1st
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare ."/merlin/vim"

"syntax and type errior on saving file
let g:syntastic_ocaml_checkers = ['merlin']
"
"************************************** end merlin **********************


"****************************************ultisnips settings ************
"
"" Trigger configuration for ultisnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-space>"
"let g:UltiSnipsJumpForwardTrigger="<C-B>"  "tab 
"let g:UltiSnipsJumpBackwardTrigger="<C-Z>" "and <C-p> works just fine

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"call of personlized .ycm_extra_conf.py
"let g:ycm_global_extra_conf = '~/Documents/path/thierry/.ycm_extra_conf.py'
"
"*************************************** end ultisnips ************************




"**************************vim-auto-save setting*******************************

"run :AutoSaveToggle to enable/disable it
let g:auto_save = 1	    "enable on startup
let g:auto_save_events = ["InsertLeave"] "save every modification in insert mode
"let g:auto_save_silent = 1  "do not display the auto-save notification
"possible events :
  "'TextChangedI'  will save after a change was made to the text in the current
  "buffer in insert mode
  "'CursorHold' will save every amount of milleSeconds as definies in the
  "'updatetime' option in normal mode
  "'CompleteDone' will also trigger a save after every completion event
  
"********************end of vim-auto-save setting*****************************

"map to go to function def by gd meaning to me as get definition
let mapleader=" "
nnoremap  <Leader>gd :YcmCompleter GoTo<CR>

nnoremap  <Leader>fi :YcmCompleter FixIt<CR>
"nnoremap <silent> <Leader>+ :exe vertical resize  . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>- :exe vertical resize  . (winheight(0) * 2/3)<CR>

map <c-n> <c-w><
map <c-m> <c-w>>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"open NEERDTree always
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q| endif

"set spelllan to check
set spelllang=en_us,fr

"spell checkin option
set spell

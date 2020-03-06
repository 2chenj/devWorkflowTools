set nocompatible                    "be improved, required
filetype off                        "required
set path+=**
set wildmenu

"create he 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

"set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"keep Plugin commands between wundle#begin/end

"plugin not yet understood !!
Plugin 'tpope/vim-fugitive'

"autocompletion for c languages
Plugin 'Valloric/YouCompleteMe'

"let us get some syntax
Plugin 'scrooloose/syntastic'

"autosave on events configured more details on github
Plugin '907th/vim-auto-save'

"this particular scheme won't work
"Plugin 'cliuj/vim-dark-meadow'

"tired of solrized scheme
Plugin 'keith/parsec.vim'

"all of your plugins must be added before the following line
call vundle#end()
filetype plugin indent on               "required
"to ignire plugin ident changes, instead use:
"filetype plugin on
"
"Brief help
":PluginList                -lists configured plugins
":PluginInstall             -installs plugins, append '!' to update or just :Plugin update
":PluginSearch              -searches for foo; append '!' to refresh local cache
"PluginClean                -confirms removal of unused plugins; append '!' to
"auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"put your non-plugin stuff after this line 
"
" to install from command line vim +PluginInstall +qall
set number

"recherche en live
set incsearch 

"highlight les patterns matché
"set hlsearch
"************************merlin related ****************************

"this make opam add merlin to vim's runtime-path
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

"syntax and type error check on saving file
let g:syntastic_ocaml_checkers = ['merlin']

"********************* end merlin ***********************************


"*************************vim-auto-save settings**********************
"by saving erlier triggers merlin to check syntax earlier

"run :AutoSaveToggle to enable/disable it

let g:auto_save = 1                     "enable on vim startup
let g:auto_save_events = ["InsertLeave"] "save when leave insert mode
let g:auto_save_silent = 1              "do not display the auto-save notif

"************************end auto-save ********************************

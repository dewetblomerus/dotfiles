set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set encoding=utf-8
set fileencoding=utf-8
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
syntax enable
filetype plugin indent on
set backspace=2
set number
set t_Co=256
set autoindent
set cindent
set shiftwidth=2
set softtabstop=2
set history=50
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:tlist_coffee_settings = 'coffee;f:function;v:variable'
let g:Powerline_symbols = 'fancy'
let mapleader=','
let coffee_indent_keep_current = 1
" test
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233
set incsearch
set hlsearch
noh " clear the initial highlight after sourcing
set ignorecase smartcase
set number
set relativenumber
set scrolloff=5
set mouse=a
set laststatus=2 " always show the status bar
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*
" test end
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
noremap <Leader>s :update<CR>
noremap <Leader>bi :BundleInstall<CR>
noremap <Leader>h :nohlsearch<CR>
noremap <Leader>q :x<CR>
noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>
noremap <Leader>i mmgg=G`m<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<c
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 3
let g:hardtime_timeout = 2000

autocmd Filetype markdown setlocal sts=3 sw=3
autocmd Filetype ruby setlocal sts=2 sw=2

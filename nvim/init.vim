if &compatible
  set nocompatible               " Be iMproved
endif

colorscheme desert
set encoding=utf-8
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set cindent
set splitright
"set clipboard=unnamed
set hlsearch
set virtualedit=block   " BOX selection
set ambiwidth=double    " for zenkaku
set ignorecase
set smartcase
set showmatch matchtime=1
set nobackup
set list                " show invisible char
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
set display=lastline    " show long ine as much as possible
set updatetime=1000
set notimeout
set makeprg=make\ -j8
set termguicolors
set pumblend=10

" Required:
set runtimepath+=/home/kat/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kat/.cache/dein')
  call dein#begin('/home/kat/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kat/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('chrisbra/Recover.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ycm-core/YouCompleteMe', {'merged': 0})
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('kana/vim-submode')

  " Required:
  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" YouCompleteMe Options
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'split-or-existing-window'

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"

" submode
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
call submode#map('winsize', 'n', '', '+', '<C-w>+')

let mapleader = "\<Space>"
nnoremap <leader>e :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
tnoremap <silent> <Esc><Esc> <C-\><C-n>
nnoremap <C-TAB> :tabn<CR>
nnoremap <S-TAB> :tabN<CR>
nnoremap <leader>gd :aboveleft YcmCompleter GoTo<CR>

augroup Reloadable
    autocmd!
augroup END

autocmd Reloadable VimEnter * NERDTree | wincmd p
autocmd Reloadable BufEnter * silent  if &buftype ==# '' && @% != '' | NERDTreeMirror | NERDTreeFind | wincmd p | endif
autocmd Reloadable BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd Reloadable WinEnter * if &buftype ==# 'terminal' | startinsert | endif
autocmd Reloadable TermOpen * startinsert

hi Pmenu ctermbg=gray guibg=gray

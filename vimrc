" Enables highlight syntax
syntax on 
set nofoldenable
set noswapfile

" colorscheme codeschool

" set the visual error bell 
set visualbell t_vb=    


" mapping escape key
let g:easyescape_chars = { "k": 1, "l": 1 }
let g:easyescape_timeout = 100
cnoremap lk <ESC>
cnoremap kl <ESC>
color dracula




"Set utf-8 as standard encoding and en_us are standard encoding
set encoding=utf-8

"Display line numbers on the left
"These will be relative numbers
set number

" enable mouse
set mouse=a
set mousefocus

"wild ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX



"infer the case sensitiivity
set infercase

"need to set the flag in order to have cool features
set nocompatible

"indent properly based on the current file
filetype indent plugin on
filetype plugin on

"pathogen load
call pathogen#infect()
call pathogen#helptags()


set completeopt=longest,menuone


" this is only for audio, maybe to reduce annoying sounds
set visualbell

" highlight the search when searching something
set hlsearch

"tabs in command line mode for autocompletion
set wildmode=longest,list,full
set wildmenu

" set sidescrolloff=0
"tab is four spaces
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set incsearch
set expandtab
set shiftwidth=4
set softtabstop=4

map j gj
map k gk

"Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"for splits in vim 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction


 " If text is selected, save it in the v buffer and send that buffer it to
 " tmux
vmap <c-m> "vy :call VimuxSlime()<CR>
 " Select current paragraph and send it to tmux
nmap <c-m>  vip<LocalLeader>vs<CR>


" For creating runner window
let g:VimuxUseNearest=1
map <Leader>vg :call VimuxOpenRunner()<CR>


function! VimuxCreatePythonWindow()
    call VimuxOpenRunner()
    call VimuxSendText("python")
    call VimuxSendKeys("Enter")
endfunction

map <Leader>vpy :call VimuxCreatePythonWindow()<CR>

map <Leader>pc :VimuxRunLastCommand<CR>

function! VimuxCompile()
    call VimuxSendText("make build")
    call VimuxSendKeys("Enter")
endfunction

function! VimuxClean()
    call VimuxSendText("make clean")
    call VimuxSendKeys("Enter")
endfunction

function! VimuxRunMake()
    call VimuxSendText("make run")
    call VimuxSendKeys("Enter")
endfunction

map <Leader>cc :call VimuxCompile()<CR>
map <Leader>lc :call VimuxClean()<CR>
map <Leader>lr :call VimuxRunMake()<CR>



let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


set runtimepath ^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode='ra'


" EasyMotion Setup

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)


" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let @a=" [ ]"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
map <Leader>cl :noh

let g:auto_save = 1
let g:markdown_enable_spell_checking = 0
let g:auto_save_in_insert_mode = 0  
let g:tmpl_search_paths = ['~/.vim/templates']
let g:tmpl_auto_initialize = 0


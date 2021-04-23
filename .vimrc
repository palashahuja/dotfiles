set nocompatible

" no swapfile
set noswapfile


" set tabs to 4 spaces

" no spell check
set nospell

filetype plugin on       
syntax on
set backspace=indent,eol,start


" let g:ycm_keep_logfiles = 1
" let g:ycm_log_level = 'debug'


set completeopt=menu,preview,noinsert

" enable autocomplete 

"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
else
	let &t_SI.="\e[5 q" "SI = INSERT mode
	let &t_SR.="\e[4 q" "SR = REPLACE mode
	let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
endif


nnoremap <PSPACE> <Nop>
let mapleader = ','

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

colorscheme dracula


call plug#begin('~/.config/nvim/plugged')
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'reedes/vim-colors-pencil'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
Plug 'rust-lang/rls'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'puremourning/vimspector'
"Plug 'chrisbra/csv.vim'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 3 

let md_buffer_patterns = {'md' : '[a-zA-Z_]\w{2,}:\S+'}
let md_dict_patterns = {'md' : '\\?[a-zA-Z_]\w*'}
"call deoplete#custom#source('buffer', 'keyword_patterns', md_buffer_patterns)
"call deoplete#custom#source('dictionary', 'keyword_patterns', md_dict_patterns)

au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md  set filetype=markdown

let g:vimwiki_global_ext = 0


set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set updatetime=1000

let g:livepreview_previewer = 'open -a Skim '
let g:tex_flavor = "latex"
let g:auto_save_no_updatetime = 1 

let g:auto_save = 1

let g:ycm_global_ycm_extra_conf = ''

" cursor setup
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)



" make sure that the system clipboard works with vim"
vnoremap <C-c> :'<,'>w !pbcopy<CR><CR>
noremap <C-p> :r !pbpaste<CR>


inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Markdown setup
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,u [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype markdown,rmd inoremap $ $$<Esc>F$li
autocmd Filetype markdown,rmd inoremap <expr> <Tab> getline('.')[col('.') - 2] =~ '\w' ? "<C-N>" : "<Tab>"
autocmd Filetype markdown,rmd set dictionary+=/usr/share/dict/words
autocmd Filetype markdown inoremap ,r ```<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO


" Latex Setup
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd Filetype tex inoremap ,cve \cventry<Enter>%timeline<Enter>{<++>}<Enter>%position<Enter>{<++>}<Enter>%title<Enter>{<++>}<Enter>%heading with position<Enter>{<++>}<Enter>%location<Enter>{<++>}<Enter>%description<Enter>{<++>}<Esc>12k0i
autocmd Filetype tex inoremap ,cvi \cvitem{<++>}{<++>}<Esc>0
autocmd Filetype tex inoremap ,mbi \mybitem{<++>}<Esc>0

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Compiling the file for python
map <leader>c :w! \|  !compiler <c-r>%<CR>
map <leader>j :w! \| !openview <c-r>%<CR>

set nohlsearch

"NERD Tree Setup
map <leader>nt :NERDTreeToggle<CR>

" Set file type as markdown
map <leader>mm :set ft=markdown<CR>

" project specific vimrc
set exrc

" finding files using fzf 
nnoremap <silent> <C-f> :Files<CR>


" figuring out the setup for go to definition
call coc#add_extension(
  \ 'coc-rust-analyzer',
\ )

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:rustfmt_autosave = 1
let g:rust_cargo_use_clippy = 1
" mapping for enabling debugging using visual studio code 
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" vim config for rustfmt
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:coc_disable_startup_warning = 1

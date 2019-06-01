call plug#begin('~/.local/share/nvim/plugged')

" ___Syntax checking___ 
Plug 'w0rp/ale'


" ___Language Support Package___
Plug 'sheerun/vim-polyglot'

" ___Moving around the text___
Plug 'easymotion/vim-easymotion'

" ___Undotree___
Plug 'mbbill/undotree'

" ___Pairing___
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" ___Comment___
Plug 'tpope/vim-commentary'

" ___Tag___
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" ___File Tree___
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ___Theme___
" Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as':'dracula'}

" ___Status Line___
Plug 'itchyny/lightline.vim'


" ___Semantic Highlighting___
Plug 'numirias/semshi', {'for' : 'python', 'do': ':UpdateRemotePlugins'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" ___Indentation___"
Plug 'yggdroot/indentline'


" ___Searching___
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': '.install -all' }
Plug 'junegunn/fzf.vim'

" ___Copy and Paste___
Plug 'junegunn/vim-peekaboo'

" ___Unix Command___
Plug 'tpope/vim-eunuch'

" ___Auto Completion___
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ___python___
Plug 'davidhalter/jedi-vim', {'for' : 'python'}
Plug 'zchee/deoplete-jedi', {'for' : 'python'}

" ___Snippet___
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


" ___Include File___
Plug 'Shougo/neoinclude.vim'

" ___Show Function Signature___
Plug 'Shougo/echodoc.vim'


call plug#end()

set noequalalways

" ---UI Config---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoread
set noshowmode
filetype indent on
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
color  dracula

" ---Movement Config---
nnoremap j gj
nnoremap k gk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ---General Config---
set mouse=a
set history=1000
set number
set relativenumber
set nohlsearch
set mousehide
set lazyredraw
set noswapfile
set nocompatible
set t_Co=256

" --- Searching Config ---
set ignorecase
set smartcase

" --- Folding Config---
set foldenable
set foldmethod=indent
set foldlevelstart=4
set foldnestmax=10


" ---General Mapping---
nnoremap <space> <nop>
let mapleader = "\<space>"
let maplocalleader = "\\"
nnoremap ; :
inoremap jk <esc>
inoremap kj <esc>
" Copy whole file
nnoremap <leader>ya gg"+yG
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use s-tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Path Config
let g:python_host_prog="/usr/bin/python2"
let g:python_host_prog="/usr/bin/python3"


" ---EasyMotion Config---
nmap <leader>s <Plug>(easymotion-prefix)s


" ---Ale Config---
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
		\ 'cpp': ['g++'],
		\ 'python': ['pylint'],
		\}
let g:ale_python_pylint_executable = '/usr/bin/pylint'
let g:ale_python_pylint_use_globale = 1


" ---UndoTree Config---
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif
if !exists('g:undotree_SetFocusWhenToggle')
	let g:undotree_SetFocusWhenToggle = 1
endif
if !exists('g:undotree_WindowLayout')
	let g:undotree_WindowLayout = 2
endif


" ---TagBar Config---
nnoremap <F7> :TagbarToggle<CR>


" ---NerrdTree Config---
nnoremap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlighFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Change comment style
autocmd FileType c,cpp,java setlocal commentstring=//\%s


" ---FZF Config---
function! s:fzf_statusline()
	setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>; :History: <CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>oo :Tags<CR>
nnoremap <silent> <leader>? :History/<CR>
nnoremap <silent> <leader>m :Marks/<CR>
nnoremap <silent> <leader>c :commands/<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/') <CR>
nnoremap <silent> <leader>f :call SearchWordWithAg()<CR>
nnoremap <silent> <leader>f :call SearchVisualSelectionWithAg()<CR>
imap <C-x><C-f> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)
let g:fzf_colors =
	\ {'fg': ['fg', 'Normal'],
	\ 'bg': ['bg', 'Normal'],
	\ 'hl': ['fg', 'Comment'],
	\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+': ['fg', 'Statement'],
	\ 'info': ['fg', 'PreProc'],
	\ 'border': ['fg', 'Ignore'],
	\ 'prompt': ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker': ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header': ['fg', 'Comment'] }
function! SearchWordWithAg()
	execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
	let old_reg = getreg('"')
	let old_regtype = getregtype('"')
	let old_clipboard = &clipboard
	set clipboard&
	normal! ""gvy
	let selection = getreg('"')
	call setreg('"', old_reg, old_regtype)
	let &clipboard = old_clipboard
	excute 'Ag' selection
endfunction


" ---Cpp-Highlight Config---
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_hightlinght = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1


" ---Deoplete Config---
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 50)
call deoplete#custom#option('min_pattern_length', 3)
call deoplete#custom#option('sources', {
		\ '[]': ['around', 'file', 'buffer', 'neosnippet'],
		\ 'cpp': ['around', 'file', 'buffer', 'tag', 'neosnippet'],
		\ 'python' : ['around', 'jedi', 'file', 'buffer', 'tag', 'neosnippet'],
		\})
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" ---Jedi-vim---
let g:jedi#completions_enabled = 0
let g:jedi#documentation_command = "K"
let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_command = "gd"
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
let g:deoplete#sources#jedi#show_docstring = 1


" ---Echo Doc Config---
let g:echodoc_enable_at_startup = 1

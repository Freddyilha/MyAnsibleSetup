if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'szw/vim-maximizer'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'szw/vim-tags'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'yegappan/greplace'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Themes
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()

syntax enable
set autoread
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number														"Let's activate line numbers.
set complete=.,w,b,u                  "Set ou desired autocompletion matching.
set shortmess+=c
set mouse=a
set ma
set autoread
set rtp+=~/.fzf                          "Seting the path for fzf
set nu rnu
set ignorecase
set smartcase
set sessionoptions-=options
set guicursor=n-v-c:block-Cursor

"--------------- Indentation------------------"
filetype plugin indent on
set autoindent
"set nosmartindent
set tabstop=4
set expandtab
set shiftwidth=4
set splitright
set wrap! linebreak nolist

if (has("termguicolors"))
    set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"-------------Visuals--------------"
set t_CO=256													"Use 256 colors. This is useful for Terminal Vim.
set laststatus=2
set noshowmode
" colorscheme nightfly
" colorscheme tender
colorscheme darcula
"Change the color of the divsor for vertical split
hi vertsplit ctermfg=black ctermbg=black
hi ColorColumn ctermbg=0 guibg=#d0d1da
"-------------Plugins--------------"
"LightLine
" let g:lightline = {  }
"
" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'darculaOriginal' }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LightlineFugitive()
    if &ft !~? 'vimfiler' && exists('*fugitive#head')
        let branch = fugitive#head()

       " if len(branch) > 10
        return branch
       " endif

       " let splittedBranchName = split(fugitive#head(), '-')

      "  return join([split(fugitive#head(), '-')[0], split(fugitive#head(), '-')[1]], '-')

    endif
    return ''
endfunction

" let g:lightline = {
"     \ 'colorscheme': 'seoul256',
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"     \ },
"     \ 'component_function': {
"     \   'filename': 'LightlineFilename',
"     \   'fugitive': 'LightlineFugitive',
"     \ },
"     \ }


let g:snipMate = { 'snippet_version' : 1 }

let g:slime_target = "x11"
let g:slime_python_ipython = 1

"Fuzzy Finder
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_layout = { 'up': '~40%' }
let g:fzf_preview_window = 'right:40%'

"NerdTree Configs
let NERDTreeHijackNetrw = 0

"Greplace
set grepprg=rg
let g:grep_cmd_opts = '--line-numbers --noheading'

"Windowswap
nnoremap <silent> <leader>s :call WindowSwap#EasyWindowSwap()<CR>
let g:windowswap_map_keys = 0 "prevent default bindings
set updatetime=300

"EchoDoc
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'popup'

"XDebug
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9000
let g:vdebug_options.server = ''
let g:vdebug_options.ide_key = 'testando'
let g:vdebug_options.path_maps = {"/home/user/scripts": "/home/jon/php"}
 
"Fugitive
" set diffopt+=vertical


"-------------Search--------------"
set hlsearch												"Highlight all matched terms.
set incsearch												"Incrementally highlight, as we type.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"-------------Split Management--------------"
set splitbelow 											"Make splits default to below...
set splitright											"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
" nmap <C-J> <C-W><C-J>
" nmap <C-K> <C-W><C-K>
" nmap <C-H> <C-W><C-H>
" nmap <C-L> <C-W><C-L>
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

"-------------Mappings--------------"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ'z

"Open FZF
nmap <silent> <C-p> :Files<cr>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Open Vifm
nmap <Leader>b :Vifm<cr>

"General
nmap <Leader>! :!<cr>

"Tag serch
nmap <Leader>f :BT<cr>

"Ack search
nmap <Leader>r :Rg<cr>
nmap <Leader>R :Rg <C-R>=expand('<cword>')<cr><cr>

"Git maps
nmap <Leader>gg :Git<cr>
nmap <Leader>gc :Git commit<cr>
nmap <Leader>gh :Git push<cr>
nmap <Leader>gl :Git pull<cr>
nmap <Leader>gb :GBranches<cr>

"Vim-maximizer
let g:maximizer_set_default_mapping = 0
nmap <Leader>z :MaximizerToggle<cr>

"--------------Macros--------------"
"put the var under the cursor into a die and dump func
" nmap <Leader>dd veyodd(pA;
nmap <Leader>dd F$wyiwodd($pA);€ýa


"-------------Testing---------------"
nmap <Leader>ta :!docker exec -it quiz-application ./vendor/bin/phpunit<cr>
nmap <Leader>T :!docker exec -it quiz-application ./vendor/bin/phpunit --filter
" docker exec -it quiz-application ./vendor/bin/simple-phpunit tests/AdminGameBundle/Controller/SelfAssessmentCampaignGameControllerTest.php



"------------Terminal colors------------"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"-------------Auto-Commands--------------"

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc nested source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>


" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0


"Notes And Tips
"
" CTRL + ]
" GO TO THE FUNCTION DEFINITION
"
" CTRL + 6
" GO BACK TO PREVIOUS SCREEN
"
" :bd
" CLOSE CURRENT BUFFER
"
" :tn
" GO TO NEXT TAG
"
" :tp
" GO TO PREVIOUS TAG
"
" :ts
" SELECT BETWEEN ALL TAGS
"
" Gsearch
" SELECT ALL RECURRENCES OF A PATTERN
" AFTER MODYFING USE
" Greplace TO CHANGE ALL PRESS a TO
" APPLY TO ALL AND FINALLY wa TO SAVE ALL
"
" gg
" GO TO THE TOP OF THE FILE
" 
" shift + g
" GO TO THE BOTTOM OF THE FILE
"
" cs
"CHANGE SURROUNDING
"
" 
" this command is used to change whitespaces from visual selection s/\%V\s/_/g  into underlines
"
"Create tags file
" !ctags -R --exclude=node_modules --exclude=vendor
"
"
"Vifm
" za: Toggle showing hidden files
" zo: Show hidden files
" zm: Hide hidden files
"
" Macro to update symfony services
" nyt:lopA: '@'€ýahjWWdg_k_vt:p_yt:lhph
"
" :let @" = expand("%")  copy to unamed register then just use p to paste
"
" With the code on the left and the legacy_services on the right this macro
" will replace the 'this->get' call with dependency injection
" let @q = '"/$this->get('"f'yi'l/"g_byiwh?"public function"f)i, p/"$this->get('"_yt ?"public function"f)i p/"$this->get"('d1k€ýa'
"
" mysql://{user}:{password}@{ipAddress}:{port}/{database}


" set term=xterm-256color

""" Vim-Plug
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'embark-theme/vim', { 'as': 'embark' }

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'vim-scripts/loremipsum'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'APZelos/blamer.nvim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'glepnir/dashboard-nvim'
Plug 'alvan/vim-closetag'

" Javascript development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'mlaursen/vim-react-snippets'

call plug#end()

""" Editor configurations
syntax on
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title
set signcolumn=yes

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Load the colorscheme
colorscheme embark

set nobackup
set nowritebackup
set noswapfile

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1

" Git blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 1

" Functions and autocmds to run whenever changing colorschemes
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set fillchars+=vert:\│
highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=grey

" Highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

""" Dashboard
let g:dashboard_default_executive = 'fzf'
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

""" NvimTree Setup
lua<<EOF
    require'nvim-tree'.setup {}
EOF


let g:nvim_tree_gitignore = 1
let g:nvim_tree_special_files = []
let g:nvim_tree_show_icons = {
      \ 'folder_arrows': 0,
      \ 'folders': 1,
      \ 'git': 1,
      \ 'files': 1
      \}
let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'folder': {'default': '', 'open': '', 'empty': '', 'empty_open': ''},
      \}
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }

" Airline
let g:airline_theme = 'embark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

""" Vuejs
let g:vue_pre_processors = 'detect_on_enter'

""" Vim close tag
let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>' 

""" VIM-COC
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> used for trigger completion, completion confirm, snippet expand
" and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

""" Emmet config
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'typescriptreact' : {
\      'extends' : 'jsx',
\  },
\}
let g:user_emmet_leader_key=','


""" Custom Mappings
nmap <leader>tw :call TrimWhitespace()<CR>
nmap <leader>ss :Rg<CR>
nmap <leader>hh :History<CR>
nmap <leader>ff :Files<CR>
nmap <leader>gf :GFiles --cached --others --exclude-standard<CR>
nmap <leader>bb :Buffers<CR>
nmap <leader>bl :BLines<CR>
nmap <leader>p :Prettier<CR>
nmap <leader>RR :so ~/.config/nvim/init.vim<CR>
nmap <silent>bn :bnext<CR>
nmap <silent>bp :bprevious<CR>
nmap <leader>bx :bd<CR>
inoremap <leader>w <Esc>:w<CR><Space>
nmap <leader>ww :w<CR>
nmap <leader>WW :wa<CR>
nmap <leader>k :m+1<CR>
nmap <leader>j :m-2<CR>

nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <F12> <Plug>(coc-codeaction)
nnoremap <silent> <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>nt :NvimTreeToggle<CR>
nnoremap <silent> <leader>nff :NvimTreeFindFile<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



""" Custom functions
command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction


autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


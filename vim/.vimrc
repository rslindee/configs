set nocompatible

" auto-clone and install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug plugin manager:
call plug#begin()

" Viewing
Plug 'chrisbra/vim-diff-enhanced'
" TODO: If no good, try https://github.com/whiteinge/dotfiles/blob/master/bin/diffconflicts instead
Plug 'christoomey/vim-conflicted'
Plug 'idanarye/vim-merginal'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'jceb/vim-hier'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'will133/vim-dirdiff'
Plug 'romainl/vim-qf'
Plug 'Yggdroot/indentLine'
" TODO: Try sjl/splice.vim
" Version Control
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
" Themes
Plug 'nanotech/jellybeans.vim'
" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'joereynolds/vim-minisnip'
Plug 'junegunn/vim-easy-align'
Plug 'lfilho/cosco.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'machakann/vim-sandwich'
Plug 'Rip-Rip/clang_complete'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Searching
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-grepper'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
" Other
Plug 'craigemery/vim-autotag'
Plug 'fidian/hexmode'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader to space
nnoremap <Space> <nop>
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.d

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Faster drawing
set ttyfast

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Show absolute line numbers
set number

" Disable scratch window preview in omni
set completeopt-=preview

" Mouse setup
set mouse=a
set ttymouse=xterm2

" Line highlighting
set cursorline
set cursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Themes
set background=dark
colorscheme jellybeans

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Make Scons files show up as python
autocmd BufNew,BufRead SConstruct,SConscript set filetype=python

" Make clang config files show up as yaml
autocmd BufNew,BufRead .clang-format,.clang-tidy set filetype=yaml

" Enable special doxygen highlighting
let g:load_doxygen_syntax=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile

" For whatever reason I still see undo files getting created...
set noundofile

" Reload vimrc manually
nnoremap <leader>vr :source $MYVIMRC<CR>

" Automatially reload file file if shell command is run inside vim
set autoread

" Reload current buffer only if there are no edits
nnoremap <leader>e :edit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Backspace over automatically inserted indentation
set bs=2

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap

" auto-trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" tmux-like tab creation
map <leader>c :tabnew<cr>

" Map splits to be like tmux
map <leader>" :sp<cr>
map <leader>% :vsp<cr>

" Cope shortcuts
map <silent><c-n> :cn<cr>
map <silent><c-p> :cp<cr>

" Quick-map tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use system clipboard
set clipboard=unnamed

" Copy last yank to xclip
map <leader>yy :call system("xclip -i -sel clip", getreg("\""))<cr>
" Paste from xclip on next line
map <leader>yp :r!xclip -o -sel clip<cr>

" Highlight and replace current word cursor is on
nnoremap <leader>r :%s/<C-r><C-w>//gc<Left><Left><Left>

" Call ctags
nmap <leader>C :silent !ctags<cr>:redraw!<cr>

" Set <c-d> to forward-delete in insert mode
inoremap <c-d> <del>

" Go up/down command history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" Map Y to yank until end of line
nmap Y y$

" Yank/delete entire C-style functions
map <leader>yf Vf{%d
map <leader>df Vf{%y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki config

let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \'.mkd': 'markdown'}
let g:vimwiki_list = [{'path': '~/wiki/', 'ext': '.md'}]

" Lightline Config
" Lightline arrangement
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'workingdir', 'fugitive' ] ],
            \   'right': [ [ 'lineinfo' ], ['percent'], [ 'modificationtime' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename' ] ],
            \   'right': [ [ 'lineinfo' ], ['percent'], [ 'modificationtime' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'workingdir': 'LightLineWorkingDir',
            \   'filename': 'LightLineFilename',
            \   'mode': 'LightLineMode',
            \   'modificationtime': 'LightLineModificationTime',
            \ },
            \ 'subseparator': { 'left': '│', 'right': '│' }
            \ }
let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'V',
            \ "\<C-v>": 'V',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S',
            \ "\<C-s>": 'S',
            \ 't': 'T',
            \ }

function! LightLineModificationTime()
    let ftime = getftime(expand('%'))
    return ftime != -1 ? strftime('%m/%d/%y %H:%M', ftime) : ''
endfunction

function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineWorkingDir()
    let workingdir = fnamemodify(getcwd(), ':t')
    return workingdir
endfunction

function! LightLineFilename()
    let fname = expand('%')
    return fname =~ '__Tagbar__' ? g:lightline.fname :
                \ fname =~ 'NetrwTreeListing' ? '' :
                \ exists('w:quickfix_title') ? w:quickfix_title :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' │ ' : '') .
                \ ('' != fname ? fname : '') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? '__Tagbar__\|NetrwTreeListing' && exists('*fugitive#head')
            let mark = '├'  " edit here for cool branch mark
            let branch = fugitive#head()
            return branch !=# '' ? mark.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname =~ 'NetrwTreeListing' ? 'Netrw' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

" Set max tag file size to ~100mb for autotag
let g:autotagmaxTagsFileSize = 100000000

" Make grepper prompt smaller
let g:grepper = {
            \ 'simple_prompt': 1,
            \ 'highlight': 1,
            \ }

" TODO: Disabled this for now, as it was causing errors on startup when marks
" were left. See https://github.com/kshenoy/vim-signature/issues/141
" vim-signature highlight marks based on gitgutter status
"let g:SignatureMarkTextHLDynamic = 1

" Enable vim-sneak label mode for easymotion-like behavior
let g:sneak#label = 1

" Use vimrc case settings (e.g. smartcase) for vim-sneak
let g:sneak#use_ic_scs = 1

" Dirvish sidetab
let g:loaded_netrwPlugin = 1
command! VleftDirvish leftabove vsplit | vertical resize 50 | silent Dirvish
nnoremap - :VleftDirvish<CR>
nnoremap gx :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>

" Disable vim-hier by default
let g:hier_enabled = 0

" TODO: Fork vim-hier and add toggle
"nmap <leader>Q :HierToggle

" 2-character Sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
" visual-mode
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
" operator-pending-mode
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

" Turn off indentLine by default
let g:indentLine_enabled = 0

" Toggle indentLine plugin (aka show indent markings)
nmap <leader>I :IndentLinesToggle<cr>

" Disable ALE running automatically
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 0

" Jump to ale errors
nmap [w <Plug>(ale_previous_wrap)
nmap ]w <Plug>(ale_next_wrap)
nmap ]W <Plug>(ale_last)
nmap [W <Plug>(ale_first)

" Map vim-grepper search current word with Ag
nmap <leader>f :GrepperAg <c-r><c-w><cr>

" Map vim-grepper to simply start
nmap <leader>a :Grepper<cr>

" Open fugitive Git blame
nmap <leader>b :Gblame<cr>

" fugitive git status toggle function
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
nmap <leader>gs :call ToggleGStatus()<cr>

" Load git history of file into location list
nmap <leader>gl :GV?<cr>

" Load fugitive git diff of current file against HEAD
nmap <leader>gd :Gvdiff<cr>

" Open git browser with all commits touching current file in new tab
nmap <leader>gh :GV!<cr>

" Open git browser
nmap <leader>gb :GV<cr>

" Fugitive git push
nmap <leader>gp :Gpush<cr>

" Fugitive git commit
nmap <leader>gc :Gcommit<space>-v<cr>

" Fugitive write (essentially a write and git add)
nmap <leader>gw :Gwrite<cr>

" Toggle Tagbar
nmap <leader>t :TagbarToggle<cr>

" Toggle Hexmode
nmap <leader>H :Hexmode<cr>

" Toggle location list vim-qf
nmap <leader>l <Plug>QfLtoggle

" Toggle quickfix list vim-qf
nmap <leader>q <Plug>QfCtoggle

" Search for all todo/fixme and put into quickfix list
nmap <leader>T :GrepperAg '(TODO\|FIXME)'<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Toggle rainbow parentheses
nmap <leader>R :RainbowParentheses!!<cr>

" Use anzu to echo search information
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

nmap <leader>o :FZF<cr>
" Use Ag for FZF (which respects .gitignore)
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use dispatch to do an async make with number of cores jobs
nmap <leader>mm :Make all tags -j$(nproc)<cr>

" Use dispatch to do an async make clean
nmap <leader>mc :Make clean<cr>

" Use dispatch to do an async make clang-tidy
nmap <leader>mt :Make clang-tidy<cr>

" LaTeX (rubber) macro for compiling
nnoremap <leader>x :w<CR>:silent !rubber --pdf --warn all %<cr>:redraw!<cr>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>X :!apvlv %:r.pdf &<cr><cr>

" Run vim-autoformat on entire file (falls back to vim's default
" tabbing/spacing if filetype is unsupported by any formatprogram)
nmap <leader>i :Autoformat<cr>

" vim plug binds
nmap <leader>pu :PlugUpdate<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pc :PlugClean<cr>

" Cosco config (intelligent comma/semicolon insertion)
let g:cosco_ignore_comment_lines = 1
autocmd FileType c,cpp nmap <silent> <leader>; <Plug>(cosco-commaOrSemiColon)

" Remap minisnip trigger
let g:minisnip_trigger = '<C-s>'

" Per recommendation from vim-sandwich
nmap s <Nop>
xmap s <Nop>

" mucomplete-required settings
set completeopt+=menuone
set completeopt+=noinsert
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set shortmess+=c   " Shut off completion messages

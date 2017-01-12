" vim:fdm=marker
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Krystian Paszkiewicz
"             http://kyrisu.com - krystian.paszkiewicz@gmail.com

" OS Detection  {{{
silent function! OSX()
return has('macunix')
endfunction
silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
return  (has('win16') || has('win32') || has('win64'))
endfunction
" }}}

" Plugins_Included: {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set encoding=utf8

  " Required:
  set runtimepath+=~/.dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim
endif

"dein Scripts-----------------------------
" Required:
call dein#begin(expand('~/.dotfiles/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

""
" call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('junegunn/fzf', {'build': './install --all'} )
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('junegunn/vim-easy-align')
call dein#add('airblade/vim-rooter')
call dein#add('dbakker/vim-projectroot')
call dein#add('milkypostman/vim-togglelist')
call dein#add('MarcWeber/vim-addon-local-vimrc')

call dein#add('morhetz/gruvbox')
" call dein#add('altercation/vim-colors-solarized')

""" programming general

call dein#add('SirVer/ultisnips')
call dein#add('kshenoy/vim-signature') " displays markers on the left margin
call dein#add('terryma/vim-expand-region') " + expands region, _ shrinks it
call dein#add('editorconfig/editorconfig-vim')
call dein#add('mileszs/ack.vim')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('wakatime/vim-wakatime')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('vim-scripts/TaskList.vim')
""
call dein#add('airblade/vim-gitgutter') " places vim +- marks on the left gutter
call dein#add('Yggdroot/indentLine') " prints vertical indentation lines
call dein#add('Raimondi/delimitMate') " automatic closing of quotes, brackets etc
call dein#add('Konfekt/FastFold')
""
call dein#add('honza/vim-snippets')
call dein#add('scrooloose/nerdcommenter') " commands for commenting selected text / row
" call dein#add('scrooloose/syntastic') " syntax checking with plugins
" call dein#add('neomake/neomake') " async syntax checking
call dein#add('w0rp/ale') " async linting
call dein#add('vasconcelloslf/vim-interestingwords') " keyword selection with <leader>k

""" Autocomplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/echodoc.vim')
call dein#add('carlitux/deoplete-ternjs',
      \{
      \ 'build': 'npm install -g tern',
      \ 'on_ft': [ 'javascript', 'javascript.jsx' ]
      \})

call dein#add('rhysd/devdocs.vim') " opens devdocs with shift K

" call dein#add('Chiel92/vim-autoformat')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('majutsushi/tagbar')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired') " cool bindings that I need to read more about
call dein#add('tpope/vim-fugitive') " git wrapper
call dein#add('ervandew/supertab')

" Javascript
" call dein#add('othree/yajs.vim')
call dein#add('pangloss/vim-javascript', { 'on_ft': ['javascript', 'javascript.jsx'] })
call dein#add('mxw/vim-jsx', { 'on_ft': ['javascript', 'javascript.jsx'] })
" call dein#add('maxmellon/vim-jsx-pretty', { 'on_ft': ['javascript', 'javascript.jsx'] })
call dein#add('othree/javascript-libraries-syntax.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })

call dein#add('ruanyl/vim-fixmyjs', { 'on_ft': ['javascript', 'javascript.jsx'] })
call dein#add('heavenshell/vim-jsdoc', { 'on_ft': ['javascript', 'javascript.jsx'] })
call dein#add('marijnh/tern_for_vim', {
      \ 'build' : 'npm install; npm i tern-node-express',
      \ 'on_ft': ['javascript', 'javascript.jsx']
      \ })

" Typescript
call dein#add('leafgarland/typescript-vim', { 'on_ft': ['typescript'] })
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Quramy/tsuquyomi', { 'on_ft': ['typescript'] })
call dein#add('mhartington/deoplete-typescript', { 'on_ft': [ 'typescript' ] })
call dein#add('ianks/vim-tsx', { 'on_ft': ['typescript'] })
" call dein#add('Shougo/unite.vim')
" call dein#add('mhartington/vim-typings')

call dein#add('jparise/vim-graphql')

" Markdown
call dein#add('shime/vim-livedown', {'on_ft': 'markdown'})
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})

" HTML & CSS
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('digitaltoad/vim-pug')
call dein#add('ap/vim-css-color', { 'on_ft': ['css', 'less', 'scss', 'stylus'] })
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('Valloric/MatchTagAlways')

call dein#add('mattn/emmet-vim')
call dein#add('groenewege/vim-less', {'on_ft': 'less'})
call dein#add('wavded/vim-stylus', {'on_ft': 'stylus'})

call dein#add('digitaltoad/vim-pug')

" CPP
"call dein#add('ciaranm/googletest-syntax')
call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft': 'cpp'})

" Dockerfile
call dein#add('ekalinin/Dockerfile.vim')

" config files
call dein#add('vim-scripts/nginx.vim')
call dein#add('tmatilai/gitolite.vim')
call dein#add('kyrisu/vim-mikrotik')
call dein#add('vim-scripts/openvpn')

" PYTHON
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})

" syntax

" vim
call dein#add('vim-scripts/vimwiki')
call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})

call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('Yabes/vim-complete-commit-type')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
" }}}

" => Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
  set undodir=/tmp/
  set undofile
catch
endtry

" Session
set ssop-=options
" set ssop-=folds

"}}}

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread
set exrc

set diffopt+=vertical

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>ee :e! ~/.config/nvim/init.vim<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost init.vim nested source ~/.config/nvim/init.vim
set inccommand=split
set noshowmode

map <leader>xx :.w !bash<cr>
" }}}

" NERDTree {{{
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.\.$', '\.$', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup=0
" autocmd VimEnter * NERDTree
" autocmd VimEnter * NERDTreeClose

" }}}

" CtrlP {{{
"
" map <C-b> :CtrlPBuffer<CR>
" map <C-_> :CtrlPBufTagAll<CR>
" map <leader><leader> :CtrlPTag<CR>

" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '\v[\/]\.?(node_modules|DS_Store|git|bower_components|jspm_packages|build|dist|logs)$',
  " \ 'file': '\v\.(exe|so|dll|o)$'
  " \ }

" let g:ctrlp_extensions = ['mru', 'files', 'buffertag', 'buf']

" set autowrite " autosave on ! and others
" }}}

" FZF {{{
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-_> :Ag<CR>
map <C-m> :FZFMru<CR>

set autowrite " autosave on ! and others
" }}}

" Easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set lazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set rnu
function! ToggleNumbersOn()
    set rnu!
    set nu
endfunction
function! ToggleRelativeOn()
    set nu!
    set rnu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

autocmd BufEnter * let &titlestring = 'NVIM ' . expand("%:t")
set title

" }}}

" => Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

if LINUX() && has("gui_running")
  set guifont=Inconsolata\ 12,Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
elseif OSX() && has("gui_running")
  set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
elseif WINDOWS() && has("gui_running")
  set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
endif

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=e
  set guioptions-=L "remove left scrollbar when there is vertical split
  set guioptions-=l "remove left scrollbar
else
endif

if has ("gui_running")
  set background=dark
else
  set background=dark
  set t_Co=256
endif

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'

colorscheme gruvbox

" let g:hybrid_custom_term_colors = 1
" colorscheme hybrid

try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types
" }}}

" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set list


" }}}

" => Visual mode related {{{
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
" map <leader>g :vimgrep // ./**/*.<left><left><left><left><left><left><left><left><left>

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Visual shifting
vnoremap < <gv
vnoremap > >gv
"}}}

" => Moving around, tabs and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>
map <leader>c :bp\|bd #<cr>

" Close all the buffers
map <leader>ba :NERDTreeClose<bar>bufdo bd<cr>

" Close all the buffers but current
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

map <leader>bo :NERDTreeClose <bar> call CloseAllBuffersButCurrent()<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>
map <S-l> :bn<cr>
map <S-h> :bp<cr>

"jump to alternative file
nnoremap <leader>a <C-^>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"}}}

" => Statusline {{{
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
"let g:airline_theme = 'gruvbox'
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename in the tabline
"

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" }}}

" => General Abbrevs {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" }}}

" => Editing mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t

set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespaceo

"}}}

" => Omni complete functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction
autocmd WinEnter * call Preview_func()

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" let g:deoplete#disable_auto_complete = 1
" if !exists('g:deoplete#omni#input_patterns')
  " let g:deoplete#omni#input_patterns = {}
" endif

" let g:deoplete#omni#input_patterns.typescript = '[^. *\t]\.\w*'

" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
  " \ 'tern#Complete',
  " \ 'jspc#omni'
  " \]

" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'omni']
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'omni']

"autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
autocmd FileType sql set omnifunc=sqlComplete#CompleteSQL
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1
"let g:SuperTabDefaultCompletionType = 'context'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<C-k>"
"let g:UltiSnipsJumpForwardTrigger = "<C-n>"
"let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_java_javac_config_file_enabled=1

let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips', $HOME.'/.dotfiles/nvim/bundle/vim-snippets/UltiSnips']

function! Neoj()
    if pumvisible() == 1
        return "\<C-n>"
    else
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
            return "\<C-j>"
        endif
        return ""
    endif
endfunction

function! Neok()
  if pumvisible() == 1
    return "\<C-p>"
  else
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
      return "\<C-k>"
    endif
    return ""
  endif
endfunction

let g:ulti_expand_or_jump_res = 0
function! NeoCR()
  if pumvisible() == 1
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

let g:UltiSnipsJumpForwardTrigger = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<nop>"
"let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsExpandTrigger = "<C-k>"
inoremap <silent> <C-j> <C-R>=Neoj()<CR>
snoremap <silent> <C-j> <Esc>:call UltiSnips#JumpForwards()<CR>
inoremap <silent> <C-k> <C-R>=Neok()<CR>
snoremap <silent> <C-k> <Esc>:call UltiSnips#JumpBackwards()<CR>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

au BufEnter * exec "inoremap <silent> <CR> <C-R>=NeoCR()<CR>"

set tags+=./tags
"}}}

" => Programming general section {{{
"""""""""""""""""""""""""""""""
" autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldmethod=syntax
" autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldlevel=2


autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
autocmd FileType javascript,typescript,css,scss,json EchoDocEnable

set completeopt=longest,menuone
set splitbelow

" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
"let g:formatdef_jsbeautify_javascript = '"js-beautify"'

nmap K <Plug>(devdocs-under-cursor)

let g:syntastic_aggregate_errors = 1

" autocmd BufWritePost * Neomake

let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
"
let g:ale_linters = {
\   'typescript': ['tslint'],
\}
" Asynchronous Lint Engine
let g:ale_sign_error = '✖✖'
let g:ale_sigin_warning = '⚠⚠'
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" => JavaScript section {{{
"""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
" let g:neomake_javascript_enabled_makers = ['eslint']
map <leader>nn :!node %<CR>
map <leader>nm :!mocha %<CR>

let g:used_javascript_libs = ''
"let g:used_javascript_libs = 'underscore,angularjs,handlebars'

let g:tern_show_argument_hints='on_hold'
"let g:tern_show_argument_hints=1
let g:tern_show_signature_in_pum=1
let g:tern_map_keys=1
let g:tern_map_prefix='<leader>'

"let g:tern#arguments=["--verbose"]

" Use tern_for_vim.with deoplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

autocmd FileType javascript nnoremap gd :TernDef<cr>

" insert newline when pressing enter between brackets
autocmd FileType javascript inoremap {<CR>  {<CR>}<C-c><S-o>
autocmd FileType javascript inoremap [<CR>  [<CR>]<C-c><S-o>

autocmd! BufRead,BufNewFile,BufEnter *.spec.js UltiSnipsAddFiletype javascript-spec

autocmd! BufRead,BufNewFile,BufEnter *.js UltiSnipsAddFiletype javascript-es6
autocmd! BufRead,BufNewFile,BufEnter *.ts UltiSnipsAddFiletype javascript javascript-es6

autocmd! BufRead,BufNewFile,BufEnter webpack.config.babel.js UltiSnipsAddFiletype javascript-webpack
autocmd! BufRead,BufNewFile,BufEnter package.json UltiSnipsAddFiletype javascript-package

autocmd! BufRead,BufNewFile,BufEnter .eslintrc UltiSnipsAddFiletype javascript-eslint
autocmd! BufRead,BufNewFile,BufEnter .eslintrc setlocal ft=json
autocmd! BufRead,BufNewFile,BufEnter .babelrc setlocal ft=json

let g:angular_source_directory = 'src/client/app'
let g:angular_test_directory = 'tests/client'

let g:indentLine_noConcealCursor=1
let g:indentLine_concealcursor = 'vc'
let g:indentLine_faster = 1

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 'v:variable',
        \ 's:strings'
    \ ]
\ }

let g:webdevicons_enable_ctrlp = 0

" generate ctags
command! JStags !find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags

" this will be usefull in the feature when jsctags has append option
"autocmd BufWritePost *
      "\ if filereadable('tags') |
      "\   call system('ctags -a '.expand('%')) |
      "\ endif

" JSX
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 0
autocmd FileType javascript.jsx UltiSnipsAddFiletype javascript-react

autocmd FileType javascript vnoremap <buffer>  <leader>ff :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <leader>ff :call RangeJsBeautify()<cr>

" => JSON section {{{
"""""""""""""""""""""""""""""""
"autocmd FileType json set conceallevel=0
"autocmd BufNewFile,BufRead,FileReadPre *.json set conceallevel=0
"let g:indentLine_conceallevel = 0
"}}}

""""""""""""""""""""""""""""""
" => HTML & CSS
"""""""""""""""""""""""""""""""
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_less_checkers = ['lessc']
let g:syntastic_scss_checkers = ['sass_lint']

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> Expander()

au BufNewFile,BufRead *.ejs set filetype=html

" }}}


" => Typescript section {{{
"""""""""""""""""""""""""""""""
" let g:syntastic_typescript_checkers = ['tsuquyomi']
" let g:syntastic_typescript_checkers = ['tsc', 'tslint']
" let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
" let g:neomake_typescript_enabled_makers = []

"function! neomake#makers#ft#typescript#tsc() abort
"    " tsc should not be passed a single file.  Changing to the file's dir will
"    " make it look upwards for a tsconfig.json file.
"    return {
"        \ 'args': ['--noEmit', '--jsx', 'react'],
"        \ 'append_file': 0,
"        \ 'errorformat':
"            \ '%E%f %#(%l\,%c): error %m,' .
"            \ '%E%f %#(%l\,%c): %m,' .
"            \ '%Eerror %m,' .
"            \ '%C%\s%\+%m'
"        \ }
"        " \ 'append_file': 0,
"" \ 'cwd': projectroot#guess(),
"" \ 'cwd': getcwd(),
"endfunction
"
"function! neomake#makers#ft#tsx#tsc() abort
"    " tsc should not be passed a single file.  Changing to the file's dir will
"    " make it look upwards for a tsconfig.json file.
"    return {
"        \ 'args': ['--noEmit', '--jsx', 'react'],
"        \ 'append_file': 0,
"        \ 'errorformat':
"            \ '%E%f %#(%l\,%c): error %m,' .
"            \ '%E%f %#(%l\,%c): %m,' .
"            \ '%Eerror %m,' .
"            \ '%C%\s%\+%m'
"        \ }
"endfunction

" let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_disable_quickfix = 1
" autocmd FileType typescript nnoremap gd :TsuDefinition<CR>
" autocmd FileType typescript nnoremap gr :TsuReferences<CR>
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" }}}

" => Ionic Framework section {{{
"""""""""""""""""""""""""""""""
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0

let g:syntastic_html_tidy_ignore_errors=[
  \ 'proprietary attribute',
  \ '<ion-',
  \ '</ion-',
  \ '<md-',
  \ '</md-',
  \ '<ng-',
  \ '</ng-',
  \ '<wb-',
  \ '</wb-'
  \ ]
"allow for ionic html attributes
let g:syntastic_html_tidy_blocklevel_tags = [
  \'ion-checkbox',
  \'ion-content',
  \'ion-delete-button',
  \'ion-footer-bar',
  \'ion-header-bar',
  \'ion-infinite-scroll',
  \'ion-item',
  \'ion-list',
  \'ion-modal-view',
  \'ion-nav-back-button',
  \'ion-nav-bar',
  \'ion-nav-buttons',
  \'ion-nav-view',
  \'ion-option-button',
  \'ion-pane',
  \'ion-popover-view',
  \'ion-radio',
  \'ion-refresher',
  \'ion-reorder-button',
  \'ion-scroll',
  \'ion-side-menu',
  \'ion-side-menus',
  \'ion-side-menu-content',
  \'ion-slide',
  \'ion-slide-box',
  \'ion-tab',
  \'ion-tabs',
  \'ion-toggle',
  \'ion-view',
  \'md-toolbar',
  \'md-content',
  \'md-button',
  \'md-icon',
  \'md-sidenav',
  \'md-*',
  \'ng-*',
  \'wb-*',
  \'webview',
  \'ui-*',
  \]
" }}}

" => Vim grep {{{
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=/bin/grep\ -nH

" }}}

" => Filetypes {{{
""""""""""""""""""""""""""""""
"*.ags
au BufRead,BufNewFile *.ags set ft=ags
"*.log
au BufRead,BufNewFile *.log set ft=log
" }}}

" => Markdown {{{
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
let g:vim_markdown_folding_disabled = 1
" }}}

" => YAML {{{
""""""""""""""""""""""""""""""
"autocmd FileType yaml setl indentkeys-=<:>
" }}}
"
" => C++ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nmap <leader>t :!make test<cr>
"set makeprg=g++

let g:syntastic_cpp_checkers = ['gcc']

"}}}

" => MISC {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <Leader>xt :call DeleteTrailingWS()<CR>

" Remove polish characters
" %!iconv -f cp1250 -t utf-8

"Quickly open a buffer for scripbble
map <leader>qq :e ~/buffer.wiki<cr>
au BufRead,BufNewFile ~/buffer.wiki iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

" TagBar options
if WINDOWS()
  let g:tagbar_ctags_bin = "C:\\bin\\ctags.exe"
elseif LINUX()
  let g:tagbar_ctags_bin = "ctags"
endif

nnoremap <silent> <F8> :TagbarToggle<CR>
map <F3> "zyiw:exe "h ".@z.""<CR>

cmap w!! w !sudo tee % > /dev/null %

" set autochdir
" autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif

"}}}

" => ALIASES {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! JI JavaImport
command! JIO JavaImportOrganize
"}}}

set secure

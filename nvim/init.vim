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
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('scrooloose/nerdtree')
"call dein#add('morhetz/gruvbox')
call dein#add('chriskempson/base16-vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('milkypostman/vim-togglelist')
call dein#add('MarcWeber/vim-addon-local-vimrc')
""
""" programming general
call dein#add('SirVer/ultisnips')
call dein#add('kshenoy/vim-signature')
call dein#add('terryma/vim-expand-region')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('ruanyl/vim-fixmyjs')
call dein#add('mileszs/ack.vim')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('wakatime/vim-wakatime')
call dein#add('terryma/vim-multiple-cursors')
""
call dein#add('airblade/vim-gitgutter')
call dein#add('Yggdroot/indentLine')
call dein#add('Raimondi/delimitMate')
""
call dein#add('honza/vim-snippets')
call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/syntastic')
call dein#add('vasconcelloslf/vim-interestingwords')
""
call dein#add('Shougo/deoplete.nvim')
call dein#add('carlitux/deoplete-ternjs',
      \{
      \ 'build': 'npm install -g tern',
      \ 'on_ft': [ 'javascript', 'javascript.jsx' ]
      \})

call dein#add('rhysd/devdocs.vim')

call dein#add('Chiel92/vim-autoformat')
call dein#add('majutsushi/tagbar')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-fugitive')

" Javascript
call dein#add('pangloss/vim-javascript', { 'rev': 'develop' })
call dein#add('mvolkmann/vim-js-arrow-function')
call dein#add('mxw/vim-jsx')
"call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
"call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft': 'javascript'})
"call dein#add('heavenshell/vim-jsdoc')
call dein#add('marijnh/tern_for_vim', {
      \ 'build' : 'npm install; npm i tern-node-express',
      \ 'on_ft': ['javascript', 'javascript.jsx']
      \ })
call dein#add('othree/jspc.vim', { 'on_ft': [ 'javascript', 'javascript.jsx' ] })

" config files
call dein#add('kyrisu/vim-mikrotik')
call dein#add('vim-scripts/openvpn')

" Markdown
call dein#add('shime/vim-livedown')
call dein#add('plasticboy/vim-markdown')

" HTML & CSS
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('digitaltoad/vim-pug')
call dein#add('othree/html5.vim')

call dein#add('mattn/emmet-vim')
call dein#add('groenewege/vim-less', {'on_ft': 'less'})
call dein#add('wavded/vim-stylus', {'on_ft': 'stylus'})

" CPP
"call dein#add('ciaranm/googletest-syntax')
call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft': 'stylus'})

" Dockerfile
call dein#add('ekalinin/Dockerfile.vim')

" config files
call dein#add('vim-scripts/nginx.vim')
call dein#add('tmatilai/gitolite.vim')

" syntax
call dein#add('vim-scripts/confluencewiki.vim')
call dein#add('lusis/confluence-vim')

" vim
call dein#add('vim-scripts/vimwiki')

call dein#add('ryanoasis/vim-devicons')

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
set ssop-=folds

"}}}

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread
set exrc

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = "\<Space>"
"let g:mapleader = "\<Space>"
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>ee :e! ~/.config/nvim/init.vim<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost init.vim nested source ~/.config/nvim/init.vim

" NERDTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.\.$', '\.$', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP
map <c-b> :CtrlPBuffer<CR>
map <c-/> :CtrlPBufTagAll<CR>
map <leader><leader> :CtrlPTag<CR>
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|jspm_packages'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(node_modules|DS_Store|git|bower_components|jspm_packages|build|dist|logs)$',
  \ 'file': '\v\.(exe|so|dll|o)$'
  \ }
let g:ctrlp_extensions = ['mru', 'files', 'buf', 'buffertag']


set autowrite " autosave on ! and others
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

"set cul " highlight current line
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

" highlight current line
set cursorline


if has ("gui_running")
  set background=dark
else
  set background=dark
  set t_Co=256
endif
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='medium'
"colorscheme gruvbox

let g:base16_shell_path="~/.dotfiles/base16-shell/"
hi Search ctermfg=black
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Popup menu hightLight Group
"hi Pmenu  guifg=\#000000 guibg=\#F8F8F8 ctermfg=black ctermbg=Lightgray
"hi PmenuSbar  guifg=\#8A95A7 guibg=\#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb  guifg=\#F8F8F8 guibg=\#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE


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

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"autocmd FileType javascript vnoremap <buffer>  = :call RangeJsBeautify()<cr>
"autocmd FileType html vnoremap <buffer> = :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> = :call RangeCSSBeautify()<cr>

" }}}

" => Visual mode related {{{
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // ./**/*.<left><left><left><left><left><left><left><left><left>


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

nnoremap * :normal! *``<cr>

vnoremap // y/<C-R>"<CR>``

" => Moving around, tabs and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>
map <leader>c :bp\|bd #<cr>

" Close all the buffers
map <leader>ba :NERDTreeClose<bar>bufdo bd<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

nnoremap <leader>l :ls<CR>:b<space>

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
" let g:deoplete#disable_auto_complete = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#sources = {}

let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

"autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
autocmd FileType sql set omnifunc=sqlComplete#CompleteSQL
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" YCM
let g:ycm_add_preview_to_completeopt=0
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['~/.dotfiles', '~/dev/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_user_vim_stdout = 1
let g:ycm_key_list_select_completion = ['<Tab>']
let g:ycm_key_list_previous_completion = ['<C-Tab>']
let g:ycm_server_python_interpreter = '/usr/bin/python2'
"let g:ycm_auto_trigger = 0


"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabDefaultCompletionType = 'context'

"let g:EclimCompletionMethod = 'omnifunc'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<C-k>"
"let g:UltiSnipsJumpForwardTrigger = "<C-n>"
"let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_java_javac_config_file_enabled=1

let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips', $HOME.'/.dotfiles/nvim/bundle/vim-snippets/UltiSnips']
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/bundle/vim-snippets/UltiSnips']
"let g:UltiSnipsUsePythonVersion = 2

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
autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldlevel=2

" set completeopt-=preview
set completeopt=longest,menuone,preview

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
"let g:formatdef_jsbeautify_javascript = '"js-beautify"'

nmap K <Plug>(devdocs-under-cursor)

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" }}}

" => JavaScript section {{{
"""""""""""""""""""""""""""""""
"let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_javascript_checkers = ['eslint']
map <leader>nn :!node %<CR>
map <leader>nm :!mocha %<CR>

"let g:used_javascript_libs = 'underscore,angularjs,angularui,jquery,handlebars,chai,react,flux,jasmine'
"let g:used_javascript_libs = 'underscore,angularjs,handlebars'

let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
let g:tern_map_keys=1
let g:tern_map_prefix='<leader>'
"let g:tern_show_argument_hints=1

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

autocmd! BufRead,BufNewFile,BufEnter webpack.config.babel.js UltiSnipsAddFiletype javascript-webpack
autocmd! BufRead,BufNewFile,BufEnter package.json UltiSnipsAddFiletype javascript-package

autocmd! BufRead,BufNewFile,BufEnter .eslintrc UltiSnipsAddFiletype javascript-eslint

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

" generate ctags
command! JStags !find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags

" this will be usefull in the feature when jsctags has append option
"autocmd BufWritePost *
      "\ if filereadable('tags') |
      "\   call system('ctags -a '.expand('%')) |
      "\ endif

" JSX
let g:jsx_ext_required = 0

noremap <leader>ff :JsAnonFnToArrowFn<CR>

" => JSON section {{{
"""""""""""""""""""""""""""""""
"autocmd FileType json set conceallevel=0
"autocmd BufNewFile,BufRead,FileReadPre *.json set conceallevel=0
"let g:indentLine_conceallevel = 0
"}}}

""""""""""""""""""""""""""""""
" => HTML & CSS
"""""""""""""""""""""""""""""""
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_less_checkers = ['lessc']
"let g:user_emmet_expandabbr_key='<C-p>'
"let g:user_emmet_expandabbr_key='<C-x>'

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
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
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

"let g:syntastic_cpp_checkers = ['gcc']

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
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

" TagBar options
if WINDOWS()
  let g:tagbar_ctags_bin = "C:\\bin\\ctags.exe"
elseif LINUX()
  let g:tagbar_ctags_bin = "ctags"
endif

nnoremap <silent> <F8> :TagbarToggle<CR>

cmap w!! w !sudo tee % > /dev/null %



"set autochdir

"}}}

" => ALIASES {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! JI JavaImport
command! JIO JavaImportOrganize
"}}}

set secure

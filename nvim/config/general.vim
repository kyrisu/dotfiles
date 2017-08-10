" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nv                 " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text

" No sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500

" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix

" What to save in sessions:
set sessionoptions-=blank
set sessionoptions-=options
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers
set sessionoptions+=tabpages

" Persistent undo
set undofile                " Save undo's after file closes
"set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread
set exrc
set autowrite " autosave on ! and others

set diffopt+=vertical

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Create file under cursor
map <leader>gf :exec printf('e %s/%s', expand("%:p:h"), expand("<cfile>"))<cr>
" Fast editing of the .vimrc
map <leader>ee :e! ~/.config/nvim/init.vim<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost init.vim nested source ~/.config/nvim/init.vim
set inccommand=split
set noshowmode
set splitbelow
map <leader>xx :.w !bash<cr>
" }}}

" Wildmenu {{{
" --------
"if has('wildmenu')
	"set nowildmenu
	"set wildmode=list:longest,full
	"set wildoptions=tagfile
	"set wildignorecase
	"set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	"set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store
	"set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	"set wildignore+=__pycache__,*.egg-info
"endif

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

" set termguicolors

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

"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'

"colorscheme gruvbox
"let g:solarized_termcolors=256
colorscheme solarized
hi Comment cterm=italic

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types
" }}}

" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

" }}}

" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set ruler "Always show current position

set cmdheight=3 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set lazyredraw "Don't redraw while executing macros

set mat=2 "How many tenths of a second to blink

"set rnu
"function! ToggleNumbersOn()
    "set rnu!
    "set nu
"endfunction
"function! ToggleRelativeOn()
    "set nu!
    "set rnu
"endfunction
"autocmd FocusLost * call ToggleNumbersOn()
"autocmd FocusGained * call ToggleRelativeOn()
"autocmd InsertEnter * call ToggleNumbersOn()
"autocmd InsertLeave * call ToggleRelativeOn()

autocmd BufEnter * let &titlestring = 'NVIM ' . expand("%:t")
set title
" }}}

" }}}
" Behavior {{{
" --------
"set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
"set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
"set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu

if has('patch-7.4.775')
	set completeopt+=noinsert
endif

if exists('+inccommand')
	set inccommand=nosplit
endif

" }}}

" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 2 lines left/right
set number              " Show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set tabpagemax=15       " Maximum number of tab pages
set winwidth=75         " Minimum width for current window
set winminwidth=8       " Minimum width for inactive windows
set winheight=10        " Minimum height for active window
set winminheight=4      " Minimum height for inactive windows
set pumheight=20        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=10    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set display=lastline

"====[ Show when lines extend past column 80 ]=================================>-<=====================
" copied from great config of Damian Conway found here: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
if has('patch-7.4.314')
	set shortmess+=c
endif

" Do not display message when editing files
if has('patch-7.4.1570')
	set shortmess+=F
endif
" }}}

" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

set list
" }}}

" Time {{{
" --------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=2000 " Idle time to write swap and trigger CursorHold

" Time out on key codes
if has('nvim')
	" https://github.com/neovim/neovim/issues/2017
	set ttimeoutlen=-1
else
	set ttimeoutlen=250
endif

" }}}

" }}}
" Folds {{{
" -----
if has('folding')
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=99
  set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
  " Get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

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
"let g:airline_theme = 'base16'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename in the tabline
"let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
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

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=1
endfunction

let g:deoplete_disable_auto_complete=2
call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')

" ignore UltiSnips in completion
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ["ultisnips"]
"let g:deoplete#ignore_sources['javascript'] = ["omni"]
"let g:deoplete#ignore_sources['javascript.jsx'] = ["omni"]

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction
autocmd WinEnter * call Preview_func()

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" omnifuncs
augroup omnifuncs
  autocmd!
  "autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
  autocmd FileType sql set omnifunc=sqlComplete#CompleteSQL
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"if exists('g:plugs["tern_for_vim"]')
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete
"endif

inoremap <expr><C-l> deoplete#refresh()

imap <silent><expr><CR> pumvisible() ?
	\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#close_popup())
		\ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
"
function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#manual_complete())

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#manual_complete())

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

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
"snoremap <silent> <C-j> <Esc>:call UltiSnips#JumpForwards()<CR>
inoremap <silent> <C-k> <C-R>=Neok()<CR>
"snoremap <silent> <C-k> <Esc>:call UltiSnips#JumpBackwards()<CR>
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

au BufEnter * exec "inoremap <silent> <CR> <C-R>=NeoCR()<CR>"

set tags+=./tags

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
"let g:deoplete#auto_complete_delay = 50
"let g:deoplete#auto_complete_delay = 0
"let g:deoplete#enable_refresh_always = 1
"let g:deoplete#auto_refresh_delay = 1000
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
"let g:deoplete#enable_camel_case = 1

let g:deoplete#skip_chars = ['(', ')']

"if !exists('g:deoplete#keyword_patterns')
    "let g:deoplete#keyword_patterns = {}
"endif
"let g:deoplete#keyword_patterns.default = '[a-zA-Z_]\w{2,}?'

let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
"let g:deoplete#omni#input_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
"let g:deoplete#omni#input_patterns['javascript'] = '[^. \t0-9]\.\w*'
let g:deoplete#omni#input_patterns['javascript.jsx'] = '[^. \t0-9]\.\w*'
"let g:deoplete#omni#input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?'

let g:deoplete#sources#jedi#statement_length = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#short_types = 1

let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'

"let g:deoplete#omni#functions['javascript.jsx'] = ['tern#Complete']
"let g:deoplete#omni#functions['javascript'] = ['tern#Complete']

"\ 'tern#Complete',


let g:deoplete#tag#cache_limit_size = 5000000

"let g:deoplete#enable_debug = 1
"let g:deoplete#enable_profile = 1
"call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
"}}

" => JavaScript section {{{
"""""""""""""""""""""""""""""""
autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}

let g:syntastic_javascript_checkers = ['eslint']
" let g:neomake_javascript_enabled_makers = ['eslint']
map <leader>nn :!node %<CR>
map <leader>nb :!babel-node %<CR>
map <leader>nm :!mocha %<CR>

" vim-javascript options
let g:javascript_plugin_jsdoc = 1

"nmap <silent><c-l> <Plug>(jsdoc)

" jsdoc config
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_allow_description = 0
let g:jsdoc_enable_es6 = 1

let g:used_javascript_libs = ''
"let g:used_javascript_libs = 'underscore,angularjs,handlebars'

"let g:tern_show_argument_hints='no'
let g:tern_request_timeout = 1
"let g:tern_show_argument_hints=1
let g:tern_show_signature_in_pum = 1
let g:tern_map_keys=1
let g:tern_map_prefix='<leader>'

"let g:tern#arguments=["--verbose"]

" Use tern_for_vim.with deoplete
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern#filetypes= [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]

autocmd FileType javascript nnoremap gd :TernDef<cr>
"autocmd FileType javascript nnoremap gd :TSDef<cr>

" insert newline when pressing enter between brackets
autocmd FileType javascript inoremap {<CR>  {<CR>}<C-c><S-o>
autocmd FileType javascript inoremap [<CR>  [<CR>]<C-c><S-o>

autocmd! BufRead,BufNewFile,BufEnter *.spec.js UltiSnipsAddFiletype javascript-spec

autocmd! BufRead,BufNewFile,BufEnter *.js UltiSnipsAddFiletype javascript-es6
autocmd! BufRead,BufNewFile,BufEnter *.ts UltiSnipsAddFiletype javascript javascript-es6

autocmd! BufRead,BufNewFile,BufEnter webpack.config.babel.js UltiSnipsAddFiletype javascript-webpack
autocmd! BufRead,BufNewFile,BufEnter package.json UltiSnipsAddFiletype javascript-package
autocmd FileType javascript.jsx UltiSnipsAddFiletype javascript-react

autocmd! BufRead,BufNewFile,BufEnter .eslintrc UltiSnipsAddFiletype javascript-eslint

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
"let g:xml_syntax_folding = 0

autocmd FileType javascript vnoremap <buffer>  <leader>ff :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <leader>ff :call RangeJsBeautify()<cr>

" => JSON section {{{
"""""""""""""""""""""""""""""""
"autocmd FileType json set conceallevel=0
"autocmd BufNewFile,BufRead,FileReadPre *.json set conceallevel=0
let g:indentLine_conceallevel = 0
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

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

" }}}


" => Typescript section {{{
"""""""""""""""""""""""""""""""
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
"
augroup plugin-devdocs
  autocmd!
  autocmd FileType c,cpp,rust,haskell,python,javascript nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END

"}}}

" => ALIASES {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! JI JavaImport
command! JIO JavaImportOrganize
"}}}
set secure

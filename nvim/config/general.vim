" vim: foldmethod=marker

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                   " hide buffers when abandoned instead of unload
set complete=.               " No wins, buffs, tags, include scanning
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=300           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set mouse=nv                 " Disable mouse in command-line mode
set splitbelow               " splitting a window will put the new window below the current one.
set nostartofline              " Cursor in same column for few commands

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

" Set to auto read when a file is changed from the outside
set autoread
set exrc
set autowrite " autosave on ! and others

" diff
set diffopt=filler,iwhite      " Diff mode: show fillers, ignore white
set diffopt+=vertical

let g:mapleader = ','

" Fast editing of the .vimrc
map <leader>ee :e! ~/.config/nvim/init.vim<cr>

" execute current line in bash
map <leader>xx :.w !bash<cr>
" jump to alternative file
nnoremap <leader>a <C-^>

" }}}

" => Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

if LINUX() && has('gui_running')
  set guifont=Inconsolata\ 12,Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
elseif OSX() && has('gui_running')
  set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
elseif WINDOWS() && has('gui_running')
  set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
endif

" set termguicolors
if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=e
  set guioptions-=L "remove left scrollbar when there is vertical split
  set guioptions-=l "remove left scrollbar
else
endif

set background=dark
set t_Co=256

" colorscheme solarized
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'medium'

hi Comment cterm=italic

hi TabLine cterm=NONE
hi TabLineSel cterm=reverse
hi TabLineFill cterm=NONE
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

try
  lang en_US
catch
endtry

set fileformats=unix,dos,mac "Default file types
" }}}

" => Custom commands {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost init.vim nested source ~/.config/nvim/init.vim

" Create file under cursor
map <leader>gf :exec printf('e %s/%s.%s', expand("%:p:h"), expand("<cfile>:r"), (expand("<cfile>:e") ? expand("<cfile>:e") : expand("%:p:e")))<CR><CR>

map <leader>qq :e ~/buffer.md<cr>
" }}}

" => Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 2 lines left/right
set number              " Show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters
set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set laststatus=2        " Always show a status line

set showtabline=2       " Show tabline only if there are at least 2 tab pages
" }}}

" => History {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                " Save undo's after file closes

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

if exists('+inccommand')
  set inccommand=nosplit
endif

" Sets how many lines of history VIM has to remember
set history=700

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

set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespaceo

" Visual shifting
vnoremap < <gv
vnoremap > >gv


"}}}

" => Moving around, tabs and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>
map <expr><S-l> (expand('%:t') =~ '^NERD_tree.\+') ? '\<s-l>' : ':bn<cr>'
map <expr><S-h> (expand('%:t') =~ '^NERD_tree.\+') ? '\<s-h>' : ':bp<cr>'

" Close the current buffer
map <leader>bd :silent Bclose<cr>

" Close all the buffers but current
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

map <leader>bo :NERDTreeClose <bar> call CloseAllBuffersButCurrent()<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let currentBufNum = bufnr("%")
  let alternateBufNum = bufnr("#")

  if buflisted(alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == currentBufNum
    new
  endif

  if buflisted(currentBufNum)
    execute("bdelete! ".currentBufNum)
  endif
endfunction
" }}}

" => Searching {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Map space to / (search) and c-space to ? (backgwards search)
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>
map <silent> <leader><cr> :noh<cr>

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
  exe 'menu Foo.Bar :' . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let saved_reg = @"
  execute 'normal! vgvy'

  let pattern = escape(@", '\\/.*$^~[]')
  let pattern = substitute(pattern, '\n$', '', '')

  if a:direction == 'b'
    execute "normal ?" . pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine('vimgrep ' . '/'. pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . pattern . "^M"
  endif

  let @/ = pattern
  let @" = saved_reg
endfunction
" }}}

" => Autocompletion {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup omnifuncs
  autocmd!
  "autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
  autocmd FileType sql set omnifunc=sqlComplete#CompleteSQL
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
"}}}

" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=80    " Text width maximum chars before wrapping
set expandtab       " expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
" }}}

" => JavaScript section {{{
"""""""""""""""""""""""""""""""
autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
"}}}

" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup VimStart
  autocmd BufEnter * let &titlestring = 'NVIM ' . expand("%:t")
augroup END

set title
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
  let expansionString = repeat('.', w - strwidth(foldSizeStr . line . foldLevelStr . foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

" }}}

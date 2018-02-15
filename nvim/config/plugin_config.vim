"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VimWiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0
"let g:vimwiki_ext2syntax = {}

" }}}
"
" EchoDoc {{{
let g:echodoc_enable_at_startup = 1
" }}}

" VMATH {{{
vmap <silent><expr> ++  VMATH_YankAndAnalyse()
nmap <silent>       ++  vip++
" }}}



" nvim-typescript {{{
if has_key(g:plugs, 'nvim-typescript')
  let g:nvim_typescript#javascript_support = 1
  let g:nvim_typescript#max_completion_detail=100
endif
" }}}

" EasyMotion {{{
let g:EasyMotion_smartcase = 1
" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
map  <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
" Move to line
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
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
"map <C-m> :FZFMru<CR>

" }}}

" Easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" CSV {{{
hi CSVColumnEven ctermbg=0
hi CSVColumnOdd  ctermbg=0
"let g:csv_autocmd_arrange = 1
"let g:csv_autocmd_arrange_size = 1024*1024
let g:csv_nomap_cr = 1
let g:csv_highlight_column = 'y'

"aug CSV_Editing
		"au!
		"au BufRead,BufWritePost *.csv :%ArrangeColumn
		"au BufWritePre *.csv :%UnArrangeColumn
"aug end
" }}}

" FSWITCH {{{
aug FSWITCH
  au!
  au! BufEnter *.js let b:fswitchdst = 'js' | :let b:fswitchfnames = '/$/.spec/' | let b:fswitchlocs = './'
  au! BufEnter *.spec.js let b:fswitchdst = 'js' | :let b:fswitchfnames = '/.spec$//'| let b:fswitchlocs = './'
aug end

nnoremap <leader>A :FSHere<CR>
" }}}

" FLOW {{{
"let g:flow#enable = 0
"let g:flow#autoclose = 1
" }}}

" ALE {{{
let g:ale_linters = {
      \ 'sh' : ['shellcheck'],
      \ 'vim' : ['vint'],
      \ 'html' : ['tidy'],
      \ 'python' : ['flake8'],
      \ 'markdown' : ['mdl'],
      \ 'javascript' : ['eslint'],
      \ 'javascript.jsx' : ['eslint'],
      \}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" If emoji not loaded, use default sign
try
  let g:ale_sign_error = emoji#for('boom')
  let g:ale_sign_warning = emoji#for('small_orange_diamond')
catch
  " Use same sign and distinguish error and warning via different colors.
  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '•'
endtry
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_change_sign_column_color=1

"hi ALESignColumnWithErrors ctermbg=DarkRed
" }}}

" EMOJI {{{
"set completefunc=emoji#complete
"let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed = emoji#for('collision')
" }}}

" LightLine {{{

let g:lightline = {
  \   'colorscheme': 'solarized',
  \   'active': {
  \     'left': [ [ 'mode' ], [ 'pwd' ] ],
  \     'right': [ [ 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo' ] ],
  \   },
  \   'inactive': {
  \     'left': [ [ 'pwd' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
  \   },
  \   'tabline': {
  \     'left': [ [ 'buffers' ] ]
  \   },
  \   'mode_map': {
  \     'n' : 'N',
  \     'i' : 'I',
  \     'R' : 'R',
  \     'v' : 'V',
  \     'V' : 'V-LINE',
  \     "\<C-v>": 'V-BLOCK',
  \     'c' : 'C',
  \     's' : 'S',
  \     'S' : 'S-LINE',
  \     "\<C-s>": 'S-BLOCK',
  \     't': '',
  \   },
  \   'component': {
  \     'lineinfo': '%l:%-v',
  \   },
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' },
  \   'component_expand': {
  \     'buffers': 'lightline#bufferline#buffers',
  \     'trailing': 'lightline#trailing_whitespace#component',
  \     'linter_warnings': 'lightline#ale#warnings',
  \     'linter_errors': 'lightline#ale#errors',
  \   },
  \   'component_function': {
  \     'pwd': 'LightlineWorkingDirectory',
  \     'fileinfo': 'LightlineFileinfo',
  \   },
  \   'component_type': {
  \     'buffers': 'tabsel',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \   }
  \ }

function! LightlineFileinfo()
  if winwidth(0) < 90
    return ''
  endif

  let encoding = &fenc !=# "" ? &fenc : &enc
  let format = &ff
  let type = &ft !=# "" ? &ft : "no ft"
  return type . ' | ' . format . ' | ' . encoding
endfunction

function! LightlineWorkingDirectory()
  return &ft =~ 'help\|qf' ? '' : fnamemodify(getcwd(), ":~:.")
endfunction

" }}}


"""" Lightline ALE
let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '

"""" lightline-bufferline
let g:lightline#bufferline#filename_modifier = ':~:.' " Show filename relative to current directory
let g:lightline#bufferline#unicode_symbols = 1        " Use fancy unicode symbols for various indicators
let g:lightline#bufferline#modified = ''             " Default pencil is too ugly
let g:lightline#bufferline#unnamed = '[No Name]'      " Default name when no buffer is opened
let g:lightline#bufferline#shorten_path = 1           " compress ~/my/folder/name to ~/m/f/n

""" buftabline

let g:buftabline_separators = 0
let g:buftabline_indicators = 1

" DelimitMate {{{
au FileType cpp let b:delimitMate_matchpairs_list = [['(', ')'], ['{', '}'], ['[', ']']]
au FileType cpp,javascript.jsx let b:delimitMate_expand_cr = 2
" }}}

" Prettier {{{

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" }}}

if has_key(g:plugs, 'vim-lsp')
  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
          \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
          \ })
  endif

  let g:lsp_async_completion = 1
  let g:asyncomplete_remove_duplicates = 1

  autocmd FileType javascript nnoremap gd :LspDefinition<cr>


  if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'docker-langserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
          \ 'whitelist': ['dockerfile'],
          \ })
  endif

  if executable('pyls')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
  endif

  if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'css-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
          \ 'whitelist': ['css', 'less', 'sass'],
          \ })
  endif

  autocmd FileType typescript,javascript,javascript.jsx setlocal omnifunc=lsp#complete
  autocmd FileType Dockerfile setlocal omnifunc=lsp#complete
  autocmd FileType css,less,sass setlocal omnifunc=lsp#complete
endif


" Typescript server {{{
if has_key(g:plugs, 'asyncomplete.vim')
        call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'blacklist': ['html', 'javascript'],
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))

        au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
        \ 'name': 'necosyntax',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
        \ }))

        imap <c-space> <Plug>(asyncomplete_force_refresh)

        " auto close preview window when the completion is done
        "autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
endif
" }}}

" DevDocs {{{
augroup plugin-devdocs
  autocmd!
  autocmd FileType c,cpp,rust,haskell,python,javascript nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END
" }}}

" EchoDoc {{{
set cmdheight=2         " Height of the command line
" }}}

" Ultisnips {{{
autocmd! BufRead,BufNewFile,BufEnter *.spec.js UltiSnipsAddFiletype javascript-spec

autocmd! BufRead,BufNewFile,BufEnter *.js UltiSnipsAddFiletype javascript-es6
autocmd! BufRead,BufNewFile,BufEnter *.ts UltiSnipsAddFiletype javascript javascript-es6

autocmd! BufRead,BufNewFile,BufEnter webpack.config.babel.js UltiSnipsAddFiletype javascript-webpack
autocmd! BufRead,BufNewFile,BufEnter package.json UltiSnipsAddFiletype javascript-package
autocmd FileType javascript.jsx UltiSnipsAddFiletype javascript-react

autocmd! BufRead,BufNewFile,BufEnter .eslintrc UltiSnipsAddFiletype javascript-eslint
" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}

" => Tern.JS {{{

let g:tern_request_timeout = 6000
let g:tern_show_argument_hints = 1
let g:tern_show_signature_in_pum = 1
let g:tern_map_keys=1
let g:tern_map_prefix='<leader>'

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern#filetypes= [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]
" }}}


" => Deoplete {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"function! Multiple_cursors_before()
  "let b:deoplete_disable_auto_complete=2
"endfunction
"function! Multiple_cursors_after()
  "let b:deoplete_disable_auto_complete=1
"endfunction

let g:deoplete#enable_at_startup = 1
let b:deoplete_disable_auto_complete=1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#skip_chars = ['(', ')']

let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns['javascript.jsx'] = ['[^. \t0-9]\.\w*']

let g:deoplete#sources#jedi#statement_length = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#short_types = 1

let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'

"let g:deoplete#tag#cache_limit_size = 5000000
call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')

" ignore UltiSnips in completion
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['ultisnips']

let g:deoplete#sources = {}
let g:deoplete#sources['javascript'] = ['omni', 'file', 'buffer']
let g:deoplete#sources['javascript.jsx'] = ['omni', 'file', 'buffer']
call deoplete#custom#source('omni', 'rank', 1000)

let g:deoplete#auto_complete_delay = 50

function! Preview_func()
  if &previewwindow
    setlocal nonumber norelativenumber
  endif
endfunction
autocmd WinEnter * call Preview_func()

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" omnifuncs
augroup omnifuncs_deoplete
  autocmd!
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete
augroup end

inoremap <expr><C-l> deoplete#refresh()

"imap <silent><expr><CR> pumvisible() ?
	"\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#close_popup())
		"\ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (<SID>check_back_space() ? "\<Tab>"
      \ : deoplete#manual_complete())

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (<SID>check_back_space() ? "\<Tab>"
      \ : deoplete#manual_complete())

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

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

"set tags+=./tags


"}}}

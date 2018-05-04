"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

" VimWiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0
"let g:vimwiki_ext2syntax = {}

" }}}
"
" EchoDoc {{{
let g:echodoc_enable_at_startup = 1
" }}}

" nvim-typescript {{{
if has_key(g:plugs, 'nvim-typescript')
  let g:nvim_typescript#javascript_support = 1
  let g:nvim_typescript#max_completion_detail= 100
  let g:nvim_typescript#type_info_on_hold = 1
  let g:nvim_typescript#completion_mark=''

  " autocmd FileType javascript,javascript.jsx nnoremap <silent> gd :TSDef<CR>
  autocmd FileType javascript,javascript.jsx nmap <buffer>K :TSDoc<CR>
  nnoremap <silent> <F2> :TSRename<CR>
endif
" }}}

" nvim-typescript {{{
if has_key(g:plugs, 'vim-sneak')
  let g:sneak#label = 1
  let g:sneak#use_ic_scs = 1
endif
" }}}
"
" tsuquyomi {{{
if has_key(g:plugs, 'tsuquyomi')
  let g:deoplete#sources#tss#javascript_support = 1

  let g:tsuquyomi_auto_open = 1
  let g:tsuquyomi_javascript_support = 1
  let g:tsuquyomi_disable_quickfix = 1
  let g:tsuquyomi_completion_preview = 1
  " let g:tsuquyomi_debug = 1
  " let g:tsuquyomi_tsserver_debug = 1
  autocmd FileType javascript,javascript.jsx nnoremap <silent> gd :TsuquyomiDefinition<CR>
  autocmd FileType javascript,javascript.jsx nmap <buffer>K :TsuquyomiSignatureHelp<CR>
  autocmd FileType javascript,javascript.jsx setlocal omnifunc=tsuquyomi#complete
  nnoremap <silent> <F2> :TSRename<CR>

  " set ballooneval
  " autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
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

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.\.$', '\.$', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let g:NERDTreeChDirMode=0
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup=0

" }}}

" FZF {{{
command! FZFMru call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s',
      \  'down':    '40%'})

map <C-p> :Files<CR>
" map <C-S-p> :Commands<CR>
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

" Use same sign and distinguish error and warning via different colors.
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_echo_msg_format = '[#%linter%#] %(code): %%s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_change_sign_column_color=1

" hi ALESignColumnWithErrors ctermbg=DarkRed

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" EMOJI {{{
"set completefunc=emoji#complete
"let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed = emoji#for('collision')
" }}}

" LightLine {{{

" \   'colorscheme': 'solarized',
let g:lightline = {
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

" => LanguageClient {{{

if has_key(g:plugs, 'LanguageClient-neovim')
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
        \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['javascript-typescript-stdio'],
        \ }
        " \ 'javascript': ['tcp://127.0.0.1:2089'],
        " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        " \ }

  let g:LanguageClient_autoStart = 1
  " let g:LanguageClient_trace = 'verbose'
  " let g:LanguageClient_changeThrottle = 0.5
  " let g:LanguageClient_diagnosticsEnable = 0
  " let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
  " let g:LanguageClient_settingsPath = '/home/kyrisu/.dotfiles/nvim/settings.json'

  " let g:LanguageClient_rootMarkers = ['.git', 'package.json']
  " let g:LanguageClient_rootMarkers = {
  " \ 'javascript': ['project.json', '.git'],
  " \ }

  " set completefunc=LanguageClient#complete

  " autocmd FileType javascript,javascript.jsx setlocal omnifunc=LanguageClient#complete
  " autocmd FileType c,cpp,rust setlocal omnifunc=LanguageClient#complete

  set formatexpr=LanguageClient_textDocument_rangeFormatting()

  autocmd FileType c,cpp,rust,javascript nmap <buffer>K :call LanguageClient_textDocument_hover()<CR>
  autocmd FileType c,cpp,rust,javascript nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

  let g:LanguageClient_loggingLevel = 'WARN'

  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif

" }}}

if has_key(g:plugs, 'vim-lsp')
  " if executable('typescript-language-server')
  " au User lsp_setup call lsp#register_server({
  " \ 'name': 'typescript-language-server',
  " \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
  " \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
  " \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), 'package.json'))}
  " \ })
  " endif

  let g:lsp_async_completion = 1

  autocmd FileType javascript nnoremap gd :LspDefinition<cr>

  autocmd FileType typescript,javascript,javascript.jsx setlocal omnifunc=lsp#complete
  autocmd FileType Dockerfile setlocal omnifunc=lsp#complete
  autocmd FileType css,less,sass setlocal omnifunc=lsp#complete

  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

  function! s:check_back_space() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  imap <c-space> <Plug>(asyncomplete_force_refresh)


  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
      \ })
endif

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
endif


if has_key(g:plugs, 'asyncomplete.vim')
  let g:asyncomplete_remove_duplicates = 1

  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

  " auto close preview window when the completion is done
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <tab>
        \ pumvisible() ? "\<c-n>" :
        \ <sid>check_back_space() ? "\<tab>" :
        \ asyncomplete#force_refresh()

  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'priority': 10,
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))

  if has_key(g:plugs, 'asyncomplete-tscompletejob.vim')
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
          \ 'name': 'tscompletejob',
          \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
          \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
          \ }))
  endif

  if has_key(g:plugs, 'asyncomplete-omni.vim')
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
          \ 'name': 'omni',
          \ 'whitelist': ['*'],
          \ 'blacklist': ['html', 'javascript', 'javascript.jsx'],
          \ 'completor': function('asyncomplete#sources#omni#completor')
          \  }))
  endif

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
        \ 'name': 'necosyntax',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
        \ }))
endif
" }}}

" DevDocs {{{
augroup plugin-devdocs
  autocmd!
  autocmd FileType c,cpp,rust,haskell,python,javascript,javascript.jsx nmap <buffer>KK <Plug>(devdocs-under-cursor)
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

if has_key(g:plugs, 'tern_for_vim')
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

  " omnifuncs
  augroup tern
    autocmd!
    autocmd FileType javascript setlocal omnifunc=tern#Complete
    autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete
    autocmd FileType javascript,javascript.jsx nnoremap <silent> gd :TernDef<CR>
    autocmd FileType javascript,javascript.jsx nmap <buffer>K :TernDoc<CR>
  augroup end
endif
" }}}


" => Deoplete {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has_key(g:plugs, 'deoplete.nvim')
  " function g:Multiple_cursors_before()
    " call deoplete#custom#buffer_option('auto_complete', v:false)
  " endfunction
  " function g:Multiple_cursors_after()
    " call deoplete#custom#buffer_option('auto_complete', v:true)
  " endfunction

  let g:deoplete#enable_at_startup = 1
	call deoplete#custom#option('smart_case', v:true)
	call deoplete#custom#option('refresh_always', v:true)

  " disable autocomplete by default
  " call deoplete#custom#buffer_option('auto_complete', v:false)

  " call deoplete#custom#option('auto_complete', v:false)

  " let g:deoplete#skip_chars = ['(', ')']
  let g:deoplete#auto_complete_delay = 50
  set splitbelow
  set completeopt+=noselect,menuone
  " set completeopt-=preview
  autocmd CompleteDone * pclose

  let g:deoplete#file#enable_buffer_path=1
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('tern', 'mark', '')
  call deoplete#custom#source('omni', 'mark', '⌾')
  call deoplete#custom#source('file', 'mark', '')
  call deoplete#custom#source('jedi', 'mark', '')
  call deoplete#custom#source('ultisnips', 'mark', '')
  call deoplete#custom#source('typescript', 'mark', '')
  call deoplete#custom#source('LanguageClient', 'mark', '')
  call deoplete#custom#source('typescript',  'rank', 630)
  " let g:deoplete#omni_patterns = {}
  " let g:deoplete#omni_patterns.html = ''
  " let g:deoplete#omni_patterns.css = ''

  call deoplete#custom#option('sources', {
        \ 'javascript': ['typescript', 'tern', 'LanguageClient', 'file', 'buffer'],
        \ 'javascript.jsx': ['typescript', 'tern', 'LanguageClient', 'file', 'buffer'],
        \})
        " \ 'javascript': ['typescript', 'tern', 'omni', 'file', 'buffer'],
        " \ 'javascript.jsx': ['typescript', 'tern', 'omni', 'file', 'buffer'],
        " \})
  " call deoplete#custom#source('omni', 'rank', 1000)
  " call deoplete#custom#var('omni', 'input_patterns', {
        " \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
        " \ 'java': '[^. *\t]\.\w*',
        " \ 'php': '\w+|[^. \t]->\w*|\w+::\w*',
        " \ 'javascript.jsx': '[^.t0-9]\.\w*'
        " \})

  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
    endif
  endfunction

  autocmd WinEnter * call Preview_func()
  call deoplete#custom#option('ignore_sources', {'_': ['ultisnips']})


  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#mappings#manual_complete()

  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

endif
"}}}

" => UltiSnips {{{
if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/nvim/UltiSnips', $HOME.'/.dotfiles/nvim/bundle/vim-snippets/UltiSnips']
  let g:UltiSnipsExpandTrigger = '<C-j>'
endif
" }}}

" => indentLine {{{
" let g:indentLine_conceallevel = 1
let g:vim_json_syntax_conceal = 0
" }}}

" => nerdcommenter {{{
let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" => coverage {{{
if has_key(g:plugs, 'coverage.vim')
  let g:coverage_json_report_path = 'coverage/coverage-final.json'

  let g:coverage_sign_uncovered = ''

  let g:coverage_interval = 5000
endif
" }}}

" => javascript-libraries-syntax.vim {{{
" let g:used_javascript_libs = 'react'
" }}}

" => vim-markdown {{{
let g:markdown_fenced_languages = ['js=javascript', 'html', 'python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
let g:markdown_minlines = 100
" }}}

" => vim-javascript {{{
" let g:javascript_plugin_jsdoc = 1
" }}}

" => tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

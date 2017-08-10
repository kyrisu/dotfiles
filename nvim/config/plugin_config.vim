"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VimWiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
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
"let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#max_completion_detail=100
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

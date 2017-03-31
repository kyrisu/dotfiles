"Plug Scripts-----------------------------
" Required:
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

let g:plug_window = 'new'

Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'milkypostman/vim-togglelist'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'easymotion/vim-easymotion'

Plug 'morhetz/gruvbox'

""" programming general

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kshenoy/vim-signature' " displays markers on the left margin
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'wakatime/vim-wakatime'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter' " places vim +- marks on the left gutter
Plug 'Yggdroot/indentLine' " prints vertical indentation lines
Plug 'Raimondi/delimitMate' " automatic closing of quotes, brackets etc
Plug 'Konfekt/FastFold' " Speed up Vim by updating folds only when called-for.
Plug 'scrooloose/nerdcommenter' " commands for commenting selected text / row
Plug 'w0rp/ale' " async linting
Plug 'vasconcelloslf/vim-interestingwords' " keyword selection with <leader>k
Plug 'rhysd/devdocs.vim' " opens devdocs with shift K

Plug 'Shougo/echodoc.vim'

""" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired' " cool bindings that I need to read more about
Plug 'tpope/vim-fugitive' " git wrapper

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'ruanyl/vim-fixmyjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'marijnh/tern_for_vim', {
      \ 'do' : 'npm install; npm i tern-node-express',
      \ 'for': ['javascript', 'javascript.jsx']
      \ }
Plug 'carlitux/deoplete-ternjs',
      \{
      \ 'do': 'npm install -g tern',
      \ 'for': ['javascript', 'javascript.jsx']
      \}

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
"Plug 'mhartington/nvim-typescript', { 'for': [ 'typescript', 'javascript', 'javascript.jsx' ] }
Plug 'mhartington/nvim-typescript', { 'for': [ 'typescript' ] }
Plug 'ianks/vim-tsx', { 'for': ['typescript'] }


" Markdown
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" HTML & CSS
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'scss', 'stylus'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
"Plug 'Valloric/MatchTagAlways'

Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}

" CSV
Plug 'chrisbra/csv.vim', {'for': 'csv'}

" CPP
"Plug 'ciaranm/googletest-syntax'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" config files
Plug 'vim-scripts/nginx.vim'
"Plug 'tmatilai/gitolite.vim'
"Plug 'kyrisu/vim-mikrotik'
Plug 'vim-scripts/openvpn', {'for': 'openvpn'}

" PYTHON
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" syntax
Plug 'jparise/vim-graphql'

" vim
Plug 'vim-scripts/vimwiki'
Plug 'Shougo/neco-vim', {'for': 'vim'}

Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" }}}

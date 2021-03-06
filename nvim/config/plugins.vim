"Plug Scripts-----------------------------
" Required:
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

let g:plug_window = 'new'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'milkypostman/vim-togglelist' " toggle location and quickfix list
Plug 'MarcWeber/vim-addon-local-vimrc'

" Plug 'equalsraf/neovim-gui-shim'

" Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'vim-scripts/LargeFile'

""""" programming general

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'kshenoy/vim-signature' " displays markers on the left margin
Plug 'airblade/vim-gitgutter' " places vim +- marks on the left gutter

Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine' " prints vertical indentation lines
Plug 'Raimondi/delimitMate' " automatic closing of quotes, brackets etc
Plug 'scrooloose/nerdcommenter' " commands for commenting selected text / row
Plug 'w0rp/ale' " async linting
Plug 'vasconcelloslf/vim-interestingwords' " keyword selection with <leader>k
Plug 'rhysd/devdocs.vim' " opens devdocs with shift KK
Plug 'majutsushi/tagbar'
Plug 'pedrohdz/vim-yaml-folds'

Plug 'metakirby5/codi.vim' " interactive scratchpad
Plug 'Konfekt/FastFold' " Speed up the updating folds when you use auto completion plugins

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'ruanyl/coverage.vim'
" Plug 'wakatime/vim-wakatime'

Plug 'christianrondeau/vim-base64'

"" Autocomplete

"" don't load in oni
if !exists('gui_oni')
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', {
          \ 'do': ':UpdateRemotePlugins'
          \ }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " Plug 'roxma/nvim-completion-manager'
  " Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

  " Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }

  " Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
  " Plug 'Quramy/tsuquyomi', { 'do': 'npm i -g typescript' }

  " Plug 'marijnh/tern_for_vim', {
      " \ 'do' : 'npm install; npm i tern-node-express',
      " \ 'for': ['javascript', 'javascript.jsx']
      " \ }

  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

  " Plug 'prabirshrestha/async.vim'
  " Plug 'prabirshrestha/vim-lsp'

  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'

  " Plug 'prabirshrestha/asyncomplete-file.vim'
  " Plug 'yami-beta/asyncomplete-omni.vim'
  " Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
  " Plug 'prabirshrestha/asyncomplete-flow.vim'

  " Plug 'runoshun/tscompletejob'
  " Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'

  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'

  Plug 'ap/vim-buftabline'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " allows dot to repeat more complicated expressions
Plug 'tpope/vim-unimpaired' " cool bindings that I need to read more about
Plug 'tpope/vim-fugitive' " git wrapper

""" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" This breaks jsdoc hightlighting
" Plug 'alampros/vim-styled-jsx', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'heavenshell/vim-jsdoc'

"" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }

""" Markdown
" Plug 'shime/vim-livedown', {'for': 'markdown'}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}


""" HTML & CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'scss', 'stylus'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
"Plug 'Valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax'

Plug 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html']}
Plug 'groenewege/vim-less', {'for': 'less'}

""" CSV
"Plug 'chrisbra/csv.vim', {'for': 'csv'}

""" CPP
"""Plug 'ciaranm/googletest-syntax'
"Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
"Plug 'Rip-Rip/clang_complete', {'for': 'cpp'}

""" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

""" config files
Plug 'vim-scripts/nginx.vim'
""Plug 'tmatilai/gitolite.vim'
""Plug 'kyrisu/vim-mikrotik'
Plug 'vim-scripts/openvpn', {'for': 'openvpn'}

""" PYTHON
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
"Plug 'zchee/deoplete-jedi', {'for': 'python'}

""" syntax
"Plug 'jparise/vim-graphql', {'for': 'gql'}
Plug 'tomlion/vim-solidity'
Plug 'NLKNguyen/cloudformation-syntax.vim'
Plug 'elzr/vim-json'
Plug 'GutenYe/json5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" Plug 'hashivim/vim-vagrant'

""" vim
Plug 'vim-scripts/vimwiki'
Plug 'Shougo/neco-vim', {'for': 'vim'}

Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/echodoc.vim'

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
call plug#end()

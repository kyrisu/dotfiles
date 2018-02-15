" vim:fdm=marker
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Krystian Paszkiewicz
"             http://kyrisu.com - krystian.paszkiewicz@gmail.com

" Install Vim Plug if not installed
if empty(glob('~/.dotfiles/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

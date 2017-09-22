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

" Install Vim Plug if not installed
if empty(glob('~/.dotfiles/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

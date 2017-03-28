" File-type Detection
" ------------------------------------------------

if exists('did_load_filetypes')
	finish
endif

augroup filetypedetect " {{{

	autocmd BufNewFile,BufReadPost *.feature,*.story setf cucumber

	autocmd BufNewFile,BufRead .tern-project         setf json

	autocmd BufNewFile,BufRead .eslintrc setf json
	autocmd BufNewFile,BufRead .babelrc setf json

	autocmd BufNewFile,BufRead *.csv,*.dat setf csv

augroup END " }}}

" vim: set ts=2 sw=2 tw=80 noet :

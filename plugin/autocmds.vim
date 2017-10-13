if has('autocmd')
  augroup JBAutocmds
    autocmd!

    if has('nvim')
      " Sync with corresponding non-nvim settings in ~/.vim/plugin/settings.vim:
      autocmd ColorScheme * highlight! link NonText ColorColumn
      autocmd ColorScheme * highlight! link CursorLineNr DiffText
      autocmd ColorScheme * highlight! link VertSplit LineNr
    endif
  augroup END
endif

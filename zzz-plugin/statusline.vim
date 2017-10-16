scriptencoding utf-8

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  set statusline=%7*                                 " Switch to User7 highlight group
  set statusline+=%{joshblack#statusline#lhs()}
  set statusline+=%*                                 " Reset highlight group.
  set statusline+=%4*                                " Switch to User4 highlight group (Powerline arrow).
  set statusline+=                                  " Powerline arrow.
  set statusline+=%*                                 " Reset highlight group.
  set statusline+=\                                  " Space.
  set statusline+=%<                                 " Truncation point, if not enough width available.
  set statusline+=%{joshblack#statusline#fileprefix()} " Relative path to file's directory.
  set statusline+=%3*                                " Switch to User3 highlight group (bold).
  set statusline+=%t                                 " Filename.
  set statusline+=%*                                 " Reset highlight group.
  set statusline+=\                                  " Space.
  set statusline+=%1*                                " Switch to User1 highlight group (italics).

  " Needs to be all on one line:
  "   %(                           Start item group.
  "   [                            Left bracket (literal).
  "   %R                           Read-only flag: ,RO or nothing.
  "   %{joshblack#statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{joshblack#statusline#fenc()} File-encoding if not UTF-8.
  "   ]                            Right bracket (literal).
  "   %)                           End item group.
  set statusline+=%([%R%{joshblack#statusline#ft()}%{joshblack#statusline#fenc()}]%)

  set statusline+=%*   " Reset highlight group.
  set statusline+=%=   " Split point for left and right groups.

  set statusline+=\               " Space.
  set statusline+=               " Powerline arrow.
  set statusline+=%5*             " Switch to User5 highlight group.
  set statusline+=%{joshblack#statusline#rhs()}
  set statusline+=%*              " Reset highlight group.

  if has('autocmd')
    augroup JBStatusline
      autocmd!
      autocmd ColorScheme * call joshblack#statusline#update_highlight()
      autocmd User FerretAsyncStart call joshblack#statusline#async_start()
      autocmd User FerretAsyncFinish call joshblack#statusline#async_finish()
      if exists('#TextChangedI')
        autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call joshblack#statusline#check_modified()
      else
        autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter * call joshblack#statusline#check_modified()
      endif
    augroup END
  endif
endif

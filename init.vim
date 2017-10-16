if v:progname == 'vi'
  set noloadplugins
endif

let mapleader=','

" Extension -> filetype mappings.
let filetype_m='objc'
let filetype_pl='prolog'

imap jj <Esc>

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
filetype indent plugin on
syntax on

" Would be useful mappings, but they interfe with my default window movement
" bindings (<C-j> and <C-k>).
let g:NERDTreeMapJumpPrevSibling='<Nop>'
let g:NERDTreeMapJumpNextSibling='<Nop>'

" Prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''
let g:tcommentMapLeaderCommentAnyway=''
let g:tcommentTextObjectInlineComment=''

" The default (g<) is a bit awkward to type.
let g:tcommentMapLeaderUncommentAnyway='gu'

if &loadplugins
  if has('packages')
    packloadall
  else
    source $HOME/.config/nvim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect('pack/bundle/start/{}')
  endif
endif

" After this file is sourced, plug-in code will be evaluated.
" See ~/.vim/after for files evaluated after that.
" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.
"
" To see all leader mappings, including those from plug-ins:
"
"   vim -c 'set t_te=' -c 'set t_ti=' -c 'map <space>' -c q | sort

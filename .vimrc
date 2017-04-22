"All plugins managed using git submodules and added using pathogen,
" which is a submodule itself.
"runtime bundle/pathogen/autoload/pathogen.vim
"call pathogen#infect()
"call pathogen#helptags()

set nocp " turn off vi compatibility
set nu " Turn on line numbering. (nu|nonu)
set grepprg=grep\ -nH\ $*
set noswapfile

" enchances % jumping
packadd! matchit

" Use a different list style
let g:netrw_liststyle=3

filetype plugin indent on
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='zathura'

syntax on " Set syntax on

" Indent automatically depending on filetype
set sts=2 ts=2 sw=2 expandtab
filetype plugin indent on
"set autoindent
"set smartindent
"set smarttab
hi Search ctermbg=166 ctermfg=016
" Vim Folding settings
set foldmethod=indent   "fold based on indentation
"hi Folded ctermbg=29 cterm=bold ctermfg=016
"hi FoldColumn guibg=darkgrey guifg=red
" set viewoptions=folds

set tw=78 " Wrap lines longer than 79 characters
set hidden " Allow for switching buffers without saving
set encoding=utf8
set ffs=unix,dos,mac

set lazyredraw " Don't update display while executing macros

" Smart case search
set ic
set smartcase

set wildmenu " enhanced command-line completion

set hls " Higlhight search

set lbr " Wrap text visually (does not insert '\n') (lbr|nolbr)

"colorscheme jellybeans
"colorscheme molokai
colorscheme chasing_logic 



" ruby
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" function to insert a C/C++ header file guard
"function! s:InsertGuard()
"    let randlen = 7
"    let randnum = system("xxd -c " . randlen * 2 . " -l " . randlen . " -p /dev/urandom")
"    let randnum = strpart(randnum, 0, randlen * 2)
"    let fname = expand("%")
"    let lastslash = strridx(fname, "/")
"    if lastslash >= 0
"        let fname = strpart(fname, lastslash+1)
"    endif
"    let fname = substitute(fname, "[^a-zA-Z0-9]", "_", "g")
"    let randid = toupper(fname . "_" . randnum)
"    exec 'norm O#ifndef ' . randid
"    exec 'norm o#define ' . randid
"    exec 'norm o'
"    let origin = getpos('.')
"    exec '$norm o#endif /* ' . randid . ' */'
"    norm o
"    -norm O
"    call setpos('.', origin)
"    norm w
"endfunction
"
"noremap <silent> <F12>  :call <SID>InsertGuard()<CR>
"inoremap <silent> <F12>  <Esc>:call <SID>InsertGuard()<CR>

" generate ctags recursively at the current working directory
nmap <silent> <F8> :silent !ctags -R<CR>

" build a project. Only useful if makeprg is set
nmap <F6> :make<CR>

" Toggle highlight search
nmap ,n :set invhls<CR>:set hls?<CR>

" Remove trailing whitespace
nmap <silent> ,w :%s/\s\+$<CR>

" dmenu search TODO takes too long to run!
"map <c-e> :call DmenuOpen("tabe")<cr>
"map <c-f> :call DmenuOpen("e")<cr>

" Supertab Plugin settings

set completeopt=longest,menu " select longest option, always show menu
set noeb vb t_vb=

set nofoldenable    " disable folding

"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabLongestEnhanced=1

" NERD Tree Plugin Settings

" Toggle the NERD Tree on an off with F7
"nmap <F7> :NERDTreeToggle<CR>

" let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup

" Don't display these kinds of files
"let NERDTreeIgnore=[ '\.o$', '\.a$', '\.exe$', '\.pyc$',
"                   \ '^Thumbs\.db$', '^\.sconsign\.dblite$',
"                   \ '\.swp$', '\.lib$' ]

" clang_complete Plugin Settings

" Vim sessions Plugin Settings

let g:session_autoload='no'
let g:session_autosave='no'
let g:session_persist_globals=['&makeprg']

" Disable Arrow Keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Disable Home Row Keys(!)
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

" dmenu search

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
"function! DmenuOpen(cmd)
"  let fname = Chomp(system("find . | dmenu -i -l 20 -p " . a:cmd))
"  if empty(fname)
"    return
"  endif
"  execute a:cmd . " " . fname
"endfunction

" Configure Indentline
let g:indentLine_color_term = 0

" Plugin manager vim-plug (junegunn)
call plug#begin('~/.vim/plugged')

" Superfluous Plugins
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'gerw/vim-latex-suite'
Plug 'Yggdroot/indentLine'
Plug 'jlanzarotta/bufexplorer'
Plug 'nachumk/systemverilog.vim'

" Init plugin system
call plug#end()

" Try to configure bufexplorer
"noremap <silent> <F3> :BufExplorer<CR>
nnoremap <silent> <F2> :ToggleBufExplorer<CR>
"nnoremap <silent> <m-F3> :BufExplorerHorizontalSplit<CR>
"nnoremap <silent> <c-F3> :BufExplorerVerticalSplit<CR>

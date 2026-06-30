" CSV rainbow sections: color each delimiter-separated field by column.

if exists("b:current_syntax")
  finish
endif

syntax clear

" Number of columns to color before cycling.
let s:max_cols = get(g:, 'csv_sections_columns', 24)

" CSV-ish field:
" - unquoted: no comma, quote, or newline
" - quoted: supports doubled quotes: ""
"
" This is line-based and does not handle quoted fields spanning multiple lines.
let s:field      = '\%([^,"\n]*\|"\%([^"]\|""\)*"\)'
let s:field_seen = '\%([^,"\n]\+\|"\%([^"]\|""\)*"\)'

" Delimiters stay neutral gray.
syntax match csvDelimiter /,/
highlight default csvDelimiter cterm=NONE ctermfg=244 gui=NONE guifg=#808080

" 24-color palette: no blue, no black.
let s:colors = [
      \ ['160', '#d70000'],
      \ ['34',  '#00af00'],
      \ ['178', '#d7af00'],
      \ ['166', '#d75f00'],
      \ ['162', '#d70087'],
      \ ['127', '#af00af'],
      \ ['70',  '#5faf00'],
      \ ['136', '#af8700'],
      \ ['202', '#ff5f00'],
      \ ['197', '#ff005f'],
      \ ['112', '#87d700'],
      \ ['226', '#ffff00'],
      \ ['214', '#ffaf00'],
      \ ['167', '#d75f5f'],
      \ ['94',  '#875f00'],
      \ ['125', '#af005f'],
      \ ['64',  '#5f8700'],
      \ ['148', '#afd700'],
      \ ['208', '#ff8700'],
      \ ['204', '#ff5f87'],
      \ ['172', '#d78700'],
      \ ['89',  '#87005f'],
      \ ['100', '#878700'],
      \ ['190', '#d7ff00'],
      \ ]

for s:i in range(1, s:max_cols)
  let s:grp = printf('csvSection%02d', s:i)
  let s:prefix = repeat(s:field . ',', s:i - 1)
  let s:pat = '^' . s:prefix . '\zs' . s:field_seen . '\ze\%(,\|$\)'

  execute 'syntax match ' . s:grp . ' /' . s:pat . '/'

  let s:c = s:colors[(s:i - 1) % len(s:colors)]
  execute printf(
        \ 'highlight default %s cterm=NONE ctermfg=%s gui=NONE guifg=%s',
        \ s:grp,
        \ s:c[0],
        \ s:c[1]
        \ )
endfor

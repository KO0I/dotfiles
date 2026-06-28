syntax match logError "[Ee][Rr][Rr][0o][Rr]"
syntax match logError "[Ff][Aal[Tt][Aa][L1]" "nextgroup=logWarn
syntax match logwarn "[Ww][Aa][Rr][Nn]"

syntax match logNote "[Nn][0o][Tt][Ee]\c" "nextgroup=loginfo
syntax match logTODO "TODO \c" "nextgroup=loginfo


syntax match loginfo "UVM_"
syntax match loginfo "[Ii][Nn][Ff][0o]\c" "contained
hi logError ctermfg=white ctermbg=red guifg=#ff0000
hi logharn ctermfg=black ctermbg=yellow guifg=#ffff00
hi loginfo ctermfg=lightblue ctermbg=black guifg=#ff0000
hi logNote ctermfg=green ctermbg=black guifg=#00ff00
hi logTODO ctermfg=black ctermbg=gray guifg=#00ff00

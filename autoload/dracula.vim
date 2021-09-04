" Palette: {{{

let g:dracula#palette           = {}
" let g:dracula#palette.fg        = ['#F8F8F2', 253]
let g:dracula#palette.fg        = ['#ffffe0', 253]

let g:dracula#palette.bglighter = ['#424450', 238]
let g:dracula#palette.bglight   = ['#343746', 237]
let g:dracula#palette.bg        = ['#282A36', 236]
let g:dracula#palette.bgdark    = ['#21222C', 235]
let g:dracula#palette.bgdarker  = ['#191A21', 234]

let g:dracula#palette.comment   = ['#6272A4',  61]
let g:dracula#palette.selection = ['#44475A', 239]
let g:dracula#palette.subtle    = ['#424450', 238]
let g:dracula#palette.subtledark= ['#1E2029', 234]

let g:dracula#palette.cyan      = ['#ACEBFB', 117]
let g:dracula#palette.green     = ['#88F298',  84]
let g:dracula#palette.orange    = ['#F4B26D', 215]
let g:dracula#palette.pink      = ['#F199CE', 212]
let g:dracula#palette.purple    = ['#BF9EEE', 141]
let g:dracula#palette.red       = ['#EE766D', 203]
let g:dracula#palette.yellow    = ['#F5F7A8', 228]

"
" ANSI
"
let g:dracula#palette.color_0  = '#21222C'
let g:dracula#palette.color_1  = '#EE766D'
let g:dracula#palette.color_2  = '#88F298'
let g:dracula#palette.color_3  = '#F1FA8C'
let g:dracula#palette.color_4  = '#BF9EEE'
let g:dracula#palette.color_5  = '#F199CE'
let g:dracula#palette.color_6  = '#ACEBFB'
let g:dracula#palette.color_7  = '#F8F8F2'
let g:dracula#palette.color_8  = '#6272A4'
let g:dracula#palette.color_9  = '#FF6E6E'
let g:dracula#palette.color_10 = '#69FF94'
let g:dracula#palette.color_11 = '#FFFFA5'
let g:dracula#palette.color_12 = '#D6ACFF'
let g:dracula#palette.color_13 = '#FF92DF'
let g:dracula#palette.color_14 = '#A4FFFF'
let g:dracula#palette.color_15 = '#FFFFFF'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! dracula#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'dracula'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

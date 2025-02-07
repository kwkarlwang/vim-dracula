if dracula#should_abort()
  finish
endif

" Fzf: {{{
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'DraculaOrange'],
    \ 'info':    ['fg', 'DraculaPurple'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'DraculaGreen'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif
"}}}
" ALE: {{{
if exists('g:ale_enabled')
  hi! link ALEError              DraculaErrorLine
  hi! link ALEWarning            DraculaWarnLine
  hi! link ALEInfo               DraculaInfoLine

  hi! link ALEErrorSign          DraculaRed
  hi! link ALEWarningSign        DraculaOrange
  hi! link ALEInfoSign           DraculaCyan

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif
" }}}
" CtrlP: {{{
if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif
" }}}
" GitGutter / gitsigns: {{{
if exists('g:loaded_gitgutter')
  hi! link GitGutterAdd    DraculaDiffAddSign
  hi! link GitGutterChange DraculaDiffChangeSign
  hi! link GitGutterDelete DraculaDiffDeleteSign
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
  " https://github.com/lewis6991/gitsigns.nvim requires nvim > 0.5
  " has('nvim-0.5') checks >= 0.5, so this should be future-proof.
  hi! link GitSignsAdd      DraculaDiffAddSign
  hi! link GitSignsAddLn    DraculaGreen
  hi! link GitSignsAddNr    DraculaDiffAddSign
  hi! link GitSignsChange   DraculaDiffChangeSign
  hi! link GitSignsChangeLn DraculaOrange
  hi! link GitSignsChangeNr DraculaDiffChangeSign
  hi! link GitSignsDelete   DraculaDiffDeleteSign
  hi! link GitSignsDeleteLn DraculaRed
  hi! link GitSignsDeleteNr DraculaDiffDeleteSign
endif
" }}}
" Tree-sitter: {{{
" The nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups. We only need to redefine
" those highlight groups when the defaults do not match the dracula
" specification.
" https://github.com/nvim-treesitter/nvim-treesitter/blob/master/plugin/nvim-treesitter.vim
if exists('g:loaded_nvim_treesitter')
  " deprecated TS* highlight groups
  " see https://github.com/nvim-treesitter/nvim-treesitter/pull/3656
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol DraculaPurple
  hi! link TSAnnotation DraculaYellow
  hi! link TSAttribute DraculaGreenItalic
  " # Functions
  hi! link TSFuncBuiltin DraculaCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter DraculaOrangeItalic
  hi! link TSParameterReference DraculaOrange
  hi! link TSField DraculaOrange
  hi! link TSConstructor DraculaCyan
  " # Keywords
  hi! link TSLabel DraculaPurpleItalic
  " # Variable
  hi! link TSVariableBuiltin DraculaPurpleItalic
  " # Text
  hi! link TSStrong DraculaFgBold
  hi! link TSEmphasis DraculaFg
  hi! link TSUnderline Underlined
  hi! link TSTitle DraculaYellow
  hi! link TSLiteral DraculaYellow
  hi! link TSURI DraculaYellow
  " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  " which in turn links to Identifer (white).
  hi! link TSTagAttribute DraculaGreenItalic

  if has('nvim-0.8.1')
    " # Misc
    hi! link @punctuation.delimiter Delimiter
    hi! link @punctuation.bracket DraculaFg
    hi! link @punctuation.special Special
    " # Constants
    hi! link @constant Constant
    hi! link @constant.builtin Constant
    hi! link @constant.macro Macro
    hi! link @string.regex String
    hi! link @string.escape Character
    hi! link @symbol DraculaPurple
    hi! link @annotation DraculaYellow
    hi! link @attribute DraculaGreenItalic
    hi! link @namespace Structure
    " # Functions
    hi! link @function.builtin DraculaCyan
    hi! link @function.macro Function
    hi! link @parameter DraculaOrangeItalic
    hi! link @parameter.reference DraculaOrange
    hi! link @field DraculaOrange
    hi! link @property DraculaFg
    hi! link @constructor DraculaCyan
    " # Keywords
    hi! link @label DraculaPurpleItalic
    hi! link @keyword.function DraculaPink
    hi! link @keyword.operator Operator
    hi! link @exception DraculaPurple
    " # Variable
    hi! link @variable DraculaFg
    hi! link @variable.builtin DraculaPurpleItalic
    " # Text
    hi! link @text DraculaFg
    hi! link @text.strong DraculaFgBold
    hi! link @text.emphasis DraculaFg
    hi! link @text.underline Underlined
    hi! link @text.title DraculaYellow
    hi! link @text.literal DraculaYellow
    hi! link @text.uri DraculaYellow
    hi! link @text.diff.add DiffAdd
    hi! link @text.diff.delete DiffDelete
    " # Tags
    hi! link @tag DraculaCyan
    hi! link @tag.delimiter DraculaFg
    " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
    " which in turn links to Identifer (white).
    hi! link @tag.attribute DraculaGreenItalic

    " make "public", "statc" pink
    hi! link @type.qualifier DraculaPink
  endif
endif
" }}}
" nvim-cmp: {{{
" A completion engine plugin for neovim written in Lua.
" https://github.com/hrsh7th/nvim-cmp
if exists('g:loaded_cmp')
  hi! link CmpItemAbbrDeprecated DraculaError

  hi! link CmpItemAbbrMatch DraculaCyan
  hi! link CmpItemAbbrMatchFuzzy DraculaCyan

  hi! link CmpItemKindText DraculaFg
  hi! link CmpItemKindMethod Function
  hi! link CmpItemKindFunction Function
  hi! link CmpItemKindConstructor DraculaCyan
  hi! link CmpItemKindField DraculaOrange
  hi! link CmpItemKindVariable DraculaPurpleItalic
  hi! link CmpItemKindClass DraculaCyan
  hi! link CmpItemKindInterface DraculaCyan
  hi! link CmpItemKindModule DraculaYellow
  hi! link CmpItemKindProperty DraculaPink
  hi! link CmpItemKindUnit DraculaFg
  hi! link CmpItemKindValue DraculaYellow
  hi! link CmpItemKindEnum DraculaPink
  hi! link CmpItemKindKeyword DraculaPink
  hi! link CmpItemKindSnippet DraculaFg
  hi! link CmpItemKindColor DraculaYellow
  hi! link CmpItemKindFile DraculaYellow
  hi! link CmpItemKindReference DraculaOrange
  hi! link CmpItemKindFolder DraculaYellow
  hi! link CmpItemKindEnumMember DraculaPurple
  hi! link CmpItemKindConstant DraculaPurple
  hi! link CmpItemKindStruct DraculaPink
  hi! link CmpItemKindEvent DraculaFg
  hi! link CmpItemKindOperator DraculaPink
  hi! link CmpItemKindTypeParameter DraculaCyan

  hi! link CmpItemMenu Comment
endif

hi! link markdownBlockquote        DraculaCyan
hi! link markdownBold              DraculaOrangeBold
hi! link markdownBoldItalic        DraculaOrangeBoldItalic
hi! link markdownCodeBlock         DraculaGreen
hi! link markdownCode              DraculaGreen
hi! link markdownCodeDelimiter     DraculaGreen
hi! link markdownH1                DraculaPurpleBold
hi! link markdownH2                markdownH1
hi! link markdownH3                markdownH1
hi! link markdownH4                markdownH1
hi! link markdownH5                markdownH1
hi! link markdownH6                markdownH1
hi! link markdownHeadingDelimiter  markdownH1
hi! link markdownHeadingRule       markdownH1
hi! link markdownItalic            DraculaYellowItalic
hi! link markdownLinkText          DraculaPink
hi! link markdownListMarker        DraculaCyan
hi! link markdownOrderedListMarker DraculaCyan
hi! link markdownRule              DraculaComment
hi! link markdownUrl               DraculaLink
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

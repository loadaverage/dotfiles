let s:tree_up_dir_line = '.. (up a dir)'
"NERDTreeFlags are syntax items that should be invisible, but give clues as to
"how things should be highlighted
syn match NERDTreeFlag #\~#
syn match NERDTreeFlag #\[RO\]#

"highlighting for the .. (up dir) line at the top of the tree
execute "syn match NERDTreeUp #\\V". s:tree_up_dir_line ."#"

"highlighting for the ~/+ symbols for the directory nodes
syn match NERDTreeClosable #\~\<#
syn match NERDTreeClosable #\~\.#
syn match NERDTreeOpenable #+\<#
syn match NERDTreeOpenable #+\.#he=e-1

"highlighting for the tree structural parts
syn match NERDTreePart #|#
syn match NERDTreePart #`#
syn match NERDTreePartFile #[|`]-#hs=s+1 contains=NERDTreePart

"quickhelp syntax elements
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*:#hs=s+2,he=e-1
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*,#hs=s+2,he=e-1
syn match NERDTreeHelpTitle #" .*\~#hs=s+2,he=e-1 contains=NERDTreeFlag
syn match NERDTreeToggleOn #".*(on)#hs=e-2,he=e-1 contains=NERDTreeHelpKey
syn match NERDTreeToggleOff #".*(off)#hs=e-3,he=e-1 contains=NERDTreeHelpKey
syn match NERDTreeHelpCommand #" :.\{-}\>#hs=s+3
syn match NERDTreeHelp  #^".*# contains=NERDTreeHelpKey,NERDTreeHelpTitle,NERDTreeFlag,NERDTreeToggleOff,NERDTreeToggleOn,NERDTreeHelpCommand

"highlighting for readonly files
syn match NERDTreeRO #.*\[RO\]#hs=s+2 contains=NERDTreeFlag,NERDTreeBookmark,NERDTreePart,NERDTreePartFile

"highlighting for sym links
syn match NERDTreeLink #[^-| `].* -> # contains=NERDTreeBookmark,NERDTreeOpenable,NERDTreeClosable,NERDTreeDirSlash

"highlighing for directory nodes and file nodes
syn match NERDTreeDirSlash #/#
syn match NERDTreeDir #[^-| `].*/# contains=NERDTreeLink,NERDTreeDirSlash,NERDTreeOpenable,NERDTreeClosable
syn match NERDTreeExecFile  #[|` ].*\*\($\| \)# contains=NERDTreeLink,NERDTreePart,NERDTreeRO,NERDTreePartFile,NERDTreeBookmark
syn match NERDTreeFile  #|-.*# contains=NERDTreeLink,NERDTreePart,NERDTreeRO,NERDTreePartFile,NERDTreeBookmark,NERDTreeExecFile
syn match NERDTreeFile  #`-.*# contains=NERDTreeLink,NERDTreePart,NERDTreeRO,NERDTreePartFile,NERDTreeBookmark,NERDTreeExecFile
syn match NERDTreeCWD #^[</].*$#

"highlighting for bookmarks
syn match NERDTreeBookmark # {.*}#hs=s+1

"highlighting for the bookmarks table
syn match NERDTreeBookmarksLeader #^>#
syn match NERDTreeBookmarksHeader #^>-\+Bookmarks-\+$# contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmarkName #^>.\{-} #he=e-1 contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmark #^>.*$# contains=NERDTreeBookmarksLeader,NERDTreeBookmarkName,NERDTreeBookmarksHeader

if exists("g:NERDChristmasTree") && g:NERDChristmasTree
    hi def link NERDTreePart Special
    hi def link NERDTreePartFile Type
    hi def link NERDTreeFile Normal
    hi def link NERDTreeExecFile Title
    hi def link NERDTreeDirSlash Identifier
    hi def link NERDTreeClosable Type
else
    hi def link NERDTreePart Normal
    hi def link NERDTreePartFile Normal
    hi def link NERDTreeFile Normal
    hi def link NERDTreeClosable Title
endif

hi def link NERDTreeBookmarksHeader statement
hi def link NERDTreeBookmarksLeader ignore
hi def link NERDTreeBookmarkName Identifier
hi def link NERDTreeBookmark normal

hi def link NERDTreeHelp String
hi def link NERDTreeHelpKey Identifier
hi def link NERDTreeHelpCommand Identifier
hi def link NERDTreeHelpTitle Macro
hi def link NERDTreeToggleOn Question
hi def link NERDTreeToggleOff WarningMsg

hi def link NERDTreeDir Directory
hi def link NERDTreeUp Directory
hi def link NERDTreeCWD Statement
hi def link NERDTreeLink Macro
hi def link NERDTreeOpenable Title
hi def link NERDTreeFlag ignore
hi def link NERDTreeRO WarningMsg
hi def link NERDTreeBookmark Statement

hi def link NERDTreeCurrentNode Search
"I borrowed this crazy code from vim-tomorrow-theme colorschemes

" Returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" Returns the palette index for the given grey index
fun! s:grey_colour(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" Returns an approximate colour index for the given colour level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual colour level for the given colour index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" Returns the palette index for the given R/G/B colour indices
fun! s:rgb_colour(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" Returns the palette index to approximate the given R/G/B colour levels
fun! s:colour(r, g, b)
  " Get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " Get the closest colour
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " There are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " Use the grey
      return s:grey_colour(l:gx)
    else
      " Use the colour
      return s:rgb_colour(l:x, l:y, l:z)
    endif
  else
    " Only one possibility
    return s:rgb_colour(l:x, l:y, l:z)
  endif
endfun

" Returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

  return s:colour(l:r, l:g, l:b)
endfun

" Sets the highlighting for the given group
fun! s:X(group, fg, bg, attr)
  if a:fg != ""
    exec "silent hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . s:rgb(a:fg)
  endif
  if a:bg != ""
    exec "silent hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . s:rgb(a:bg)
  endif
  if a:attr != ""
    exec "silent hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

"the original values would be 24 bit color but apparently that is not possible
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"

let s:file_extension_colors = {
  \ 'zip'      : s:green,
  \ 'txt'      : s:darkBlue,
  \ 'dat'      : s:blue,
  \ 'jade'     : s:orange,
  \ 'styl'     : s:green,
  \ 'scss'     : s:pink,
  \ 'htm'      : s:darkOrange,
  \ 'html'     : s:darkOrange,
  \ 'erb'      : s:red,
  \ 'slim'     : s:orange,
  \ 'ejs'      : s:yellow,
  \ 'css'      : s:blue,
  \ 'less'     : s:darkBlue,
  \ 'md'       : s:yellow,
  \ 'markdown' : s:yellow,
  \ 'json'     : s:yellow,
  \ 'bson'     : s:blue,
  \ 'js'       : s:beige,
  \ 'jsx'      : s:blue,
  \ 'rb'       : s:red,
  \ 'php'      : s:purple,
  \ 'py'       : s:yellow,
  \ 'pyc'      : s:yellow,
  \ 'pyo'      : s:yellow,
  \ 'pyd'      : s:yellow,
  \ 'coffee'   : s:brown,
  \ 'mustache' : s:orange,
  \ 'hbs'      : s:orange,
  \ 'conf'     : s:white,
  \ 'ini'      : s:white,
  \ 'yml'      : s:white,
  \ 'bat'      : s:white,
  \ 'jpg'      : s:aqua,
  \ 'jpeg'     : s:aqua,
  \ 'bmp'      : s:aqua,
  \ 'png'      : s:aqua,
  \ 'gif'      : s:aqua,
  \ 'ico'      : s:aqua,
  \ 'twig'     : s:green,
  \ 'cpp'      : s:blue,
  \ 'c++'      : s:blue,
  \ 'cxx'      : s:blue,
  \ 'cc'       : s:blue,
  \ 'cp'       : s:blue,
  \ 'c'        : s:blue,
  \ 'hs'       : s:beige,
  \ 'lhs'      : s:beige,
  \ 'lua'      : s:purple,
  \ 'java'     : s:purple,
  \ 'sh'       : s:lightPurple,
  \ 'fish'     : s:green,
  \ 'ml'       : s:yellow,
  \ 'mli'      : s:yellow,
  \ 'diff'     : s:white,
  \ 'db'       : s:blue,
  \ 'sql'      : s:darkBlue,
  \ 'dump'     : s:blue,
  \ 'clj'      : s:green,
  \ 'cljc'     : s:green,
  \ 'cljs'     : s:green,
  \ 'edn'      : s:green,
  \ 'scala'    : s:red,
  \ 'go'       : s:beige,
  \ 'dart'     : s:blue,
  \ 'xul'      : s:darkOrange,
  \ 'sln'      : s:purple,
  \ 'suo'      : s:purple,
  \ 'pl'       : s:blue,
  \ 'pm'       : s:blue,
  \ 't'        : s:blue,
  \ 'rss'      : s:darkOrange,
  \ 'f#'       : s:darkBlue,
  \ 'fsscript' : s:blue,
  \ 'fsx'      : s:blue,
  \ 'fs'       : s:blue,
  \ 'fsi'      : s:blue,
  \ 'rs'       : s:darkOrange,
  \ 'rlib'     : s:darkOrange,
  \ 'd'        : s:red,
  \ 'erl'      : s:lightPurple,
  \ 'hrl'      : s:pink,
  \ 'vim'      : s:green,
  \ 'ai'       : s:darkOrange,
  \ 'psd'      : s:darkBlue,
  \ 'psb'      : s:darkBlue,
  \ 'ts'       : s:blue,
  \ 'jl'       : s:purple
\}

let s:file_node_exact_matches = {
  \ 'gruntfile.coffee'                 : s:yellow,
  \ 'gruntfile.js'                     : s:yellow,
  \ 'gruntfile.ls'                     : s:yellow,
  \ 'gulpfile.coffee'                  : s:pink,
  \ 'gulpfile.js'                      : s:pink,
  \ 'gulpfile.ls'                      : s:pink,
  \ 'dropbox'                          : s:blue,
  \ '.ds_store'                        : s:white,
  \ '.gitconfig'                       : s:white,
  \ '.gitignore'                       : s:white,
  \ '.bashrc'                          : s:white,
  \ '.bashprofile'                     : s:white,
  \ 'favicon.ico'                      : s:yellow,
  \ 'license'                          : s:white,
  \ 'node_modules'                     : s:green,
  \ 'react.jsx'                        : s:blue,
  \ 'procfile'                         : s:purple,
\}

let s:file_node_pattern_matches = {
  \ '.*jquery.*\.js$'       : s:blue,
  \ '.*angular.*\.js$'      : s:red,
  \ '.*backbone.*\.js$'     : s:darkBlue,
  \ '.*require.*\.js$'      : s:blue,
  \ '.*materialize.*\.js$'  : s:salmon,
  \ '.*materialize.*\.css$' : s:salmon,
  \ '.*mootools.*\.js$'     : s:white
\}

let s:enabled_extensions = [
  \ 'bmp',
  \ 'c',
  \ 'coffee',
  \ 'cpp',
  \ 'css',
  \ 'erb',
  \ 'go',
  \ 'hs',
  \ 'html',
  \ 'java',
  \ 'jpg',
  \ 'js',
  \ 'json',
  \ 'jsx',
  \ 'less',
  \ 'lua',
  \ 'markdown',
  \ 'md',
  \ 'php',
  \ 'png',
  \ 'pl',
  \ 'py',
  \ 'rb',
  \ 'rs',
  \ 'scala',
  \ 'scss',
  \ 'sh',
  \ 'sql',
  \ 'vim',
\]

if !exists('g:NERDTreeSyntaxEnabledExtensions')
  let g:NERDTreeSyntaxEnabledExtensions = []
endif

if exists('g:NERDTreeLimitedSyntax') && !exists('g:NERDTreeSyntaxDisableDefaultExtensions')
  for extension in s:enabled_extensions
    call add(g:NERDTreeSyntaxEnabledExtensions, extension)
  endfor
endif

let s:characters = '[a-zA-Z0-9_\#\-\+\*\%\!\~\(\)\{\}\&\.\$\@]'

" Extension colors

if !exists('g:NERDTreeExtensionHighlightColor')
  let g:NERDTreeExtensionHighlightColor = {}
endif

for [key, val] in items(s:file_extension_colors)
  if ((exists('g:NERDTreeLimitedSyntax') ||
        \ exists('g:NERDTreeSyntaxDisableDefaultExtensions')) ?
        \ index(g:NERDTreeSyntaxEnabledExtensions, key) >= 0 :
        \ !has_key(g:NERDTreeExtensionHighlightColor, key))
    let g:NERDTreeExtensionHighlightColor[key] = val
  endif
endfor


for [key, val] in items(g:NERDTreeExtensionHighlightColor)
  let icon_identifier = 'nerdtreeFileExtensionIcon_'.key
  let regexp = '\v'.s:characters.'+\.'.substitute(key, '\W', '\\\0', 'g')

  if exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols["'.key.'"]')
    let icon = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[key]
    exec 'silent syn keyword '.icon_identifier.' '.icon.' containedin=NERDTreeFile'
    exec 'silent syn keyword '.icon_identifier.' '.icon.' containedin=NERDTreeExecFile'
    exec 'hi def link '.icon_identifier.' NERDTreeFile'
  endif

  if !exists('g:NERDTreeDisableFileExtensionHighlight') && val != ''
    call s:X(icon_identifier, val, '', '')
    if exists('g:NERDTreeFileExtensionHighlightFullName')
      let label_identifier = 'nerdtreeFileExtensionLabel_'.key
      exec 'silent syn match '.label_identifier.' "'.regexp.'$" containedin=NERDTreeFile'
      exec 'silent syn match '.label_identifier.' "'.regexp.'\*$" containedin=NERDTreeExecFile'
      exec 'hi def link '.label_identifier.' NERDTreeFile'
      call s:X(label_identifier, val, '', '')
    endif
  endif
endfor

"Exact Matches

if !exists('g:NERDTreeExactMatchHighlightColor')
  let g:NERDTreeExactMatchHighlightColor = {}
endif

for [key, val] in items(s:file_node_exact_matches)
  if !has_key(g:NERDTreeExactMatchHighlightColor, key)
    let g:NERDTreeExactMatchHighlightColor[key] = val
  endif
endfor

for [key, val] in items(g:NERDTreeExactMatchHighlightColor)
  let icon_identifier = 'nerdtreeExactMatchIcon_'.key
  let folder_icon_identifier = 'nerdtreeExactMatchFolderIcon_'.key
  if exists('g:WebDevIconsUnicodeDecorateFileNodesExactSymbols["'.key.'"]')
    let icon = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[key]
    exec 'silent syn keyword '.icon_identifier.' '.icon.' containedin=NERDTreeFile'
    exec 'silent syn keyword '.icon_identifier.' '.icon.' containedin=NERDTreeExecFile'
    exec 'hi def link '.icon_identifier.' NERDTreeFile'
    exec 'silent syn match '.folder_icon_identifier.' "\c['.icon.']\ze.*'.key.'\/" containedin=NERDTreeDir'
    exec 'hi def link '.folder_icon_identifier.' NERDTreeDir'
  endif

  if !exists('g:NERDTreeDisableExactMatchHighlight') && val != ''
    call s:X(icon_identifier, val, '', '')
    if exists('g:NERDTreeExactMatchHighlightFullName')
      let label_identifier = 'nerdtreeExactMatchLabel_'.key
      exec 'silent syn match '.label_identifier.' "\c'.key.'$" containedin=NERDTreeFile'
      exec 'silent syn match '.label_identifier.' "\c'.key.'\*$" containedin=NERDTreeExecFile'
      exec 'hi def link '.label_identifier.' NERDTreeFile'
      call s:X(label_identifier, val, '', '')
    endif
    if exists('g:NERDTreeHighlightFolders')
      call s:X(folder_icon_identifier, val, '', '')
      if exists('g:NERDTreeHighlightFoldersFullName')
        let folder_identifier = 'nerdtreeExactMatchFolder_'.key
        exec 'silent syn match '.folder_identifier.' "\v\c<'.key.'\ze\/" containedin=NERDTreeDir'
        exec 'hi def link '.folder_identifier.' NERDTreeDir'
        call s:X(folder_identifier, val, '', '')
      endif
    endif
  endif
endfor

"Pattern Matches

if !exists('g:NERDTreePatternMatchHighlightColor')
  let g:NERDTreePatternMatchHighlightColor = {}
endif

for [key, val] in items(s:file_node_pattern_matches)
  if !has_key(g:NERDTreePatternMatchHighlightColor, key)
    let g:NERDTreePatternMatchHighlightColor[key] = val
  endif
endfor

for [key, val] in items(g:NERDTreePatternMatchHighlightColor)
  let suffix = substitute(key, '\W', '', 'g')
  let icon_identifier = 'nerdtreePatternMatchIcon_'.suffix
  let sub_regexp = substitute(key, '\v\\@<!\.', s:characters, 'g')
  let exec_sub_regexp = substitute(sub_regexp, '\$$', '\\*$', '')

  if exists("g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['".key."']")
    let icon = g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols[key]
    exec 'syn keyword '.icon_identifier.' '.icon.' containedin=NERDTreeFile'
    exec 'hi def link '.icon_identifier.' NERDTreeFile'
  endif

  if !exists('g:NERDTreeDisablePatternMatchHighlight') && val != ''
    call s:X(icon_identifier, val, '', '')
    if exists('g:NERDTreePatternMatchHighlightFullName')
      let label_identifier = 'nerdtreePatternMatchLabel_'.suffix
      exec 'syn match '.label_identifier.' "\v\c'.sub_regexp.'" containedin=NERDTreeFile'
      exec 'syn match '.label_identifier.' "\v\c'.exec_sub_regexp.'" containedin=NERDTreeFile'
      " TODO: handle executable file
      exec 'hi def link '.label_identifier.' NERDTreeFile'

      call s:X(label_identifier, val, '', '')
    endif
  endif
endfor


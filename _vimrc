" To get this vimrc working, go to C: and make an empty directory called
" VimTempFiles

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" VIM SETTINGS

"Shows file statistics
set ruler

"Shows line numbers
set number

"Sets the background for the cursor?
highlight Normal guifg=white guibg=black

"Sets the color scheme
"You can set it to custom scheme perun if needed
colorscheme murphy

"Sets the amount of indentation made when making a new line
set sw=4

"Sets the number of spaces that a tab takes up
set tabstop=4

"Sets the font size and style
set guifont=Consolas:h10

"Makes vim maximized by default
au GUIEnter * simalt ~x

"Prevents the undo file from being created in the directory in which you're compiling
set noundofile

"Lets you click in command prompt
set mouse=a

"I mapped vv to escape so that going from insert to command mode would be easier
imap vv <Esc>

"Maps the 'a' key in command mode so that when you go from command to insert mode, the cursor
"goes one to the right 
noremap <a> <a><r>

"Makes swap file go to the directory below
set backup
set backupdir=C:\VimTempFiles
set backupskip=C:\VimTempFiles\*
set directory=C:\VimTempFiles
set writebackup

"No clue how... but this block of code makes pairs auto-indent and braces come w/ a pair
let s:pairs={
            \'<': '>',
            \'{': '}',
            \'[': ']',
            \'(': ')',
            \'«': '»',
            \'„': '“',
            \'“': '”',
            \'‘': '’',
        \}
call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val, v:val)'))
    let opts=get(a:000, 0, {})
    let start   = get(opts, 'start',   '')
    let lmiddle = get(opts, 'lmiddle', '')
    let rmiddle = get(opts, 'rmiddle', '')
    let end     = get(opts, 'end',     '')
    let prefix  = get(opts, 'prefix',  '')
    let start.=prefix
    let rmiddle.=prefix
    let left=start.a:left.lmiddle
    let right=rmiddle.join(rlist, '').end
    let moves=repeat("\<Left>", len(split(right, '\zs')))
    return left.right.moves
endfunction
 noremap! <expr> ,f   InsertPair('{')
 noremap! <expr> ,h   InsertPair('[')
 noremap! <expr> ,s   InsertPair('(')
 noremap! <expr> ,u   InsertPair('<')
inoremap {<CR> {<C-o>o}<C-o>O


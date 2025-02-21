" To get this vimrc working, go to C: and make an empty directory called
" VimTempFiles

" This is default Windows behavior.
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


" VIM SETTINGS

" Shows file statistics 
set ruler

" Shows line numbers
set number

" Sets the background for the cursor?
highlight Normal guifg=white guibg=black

" Sets the color scheme
" You can set it to custom scheme perun if needed
colorscheme perun

" Reduces wait time when doing a multi-key sequence
set timeoutlen=1000

" Sets the amount of indentation made when making a new line
set sw=4

" autoindent makes indentation occur automatically when creating a newline
" noexpandtab makes it so tabs aren't turned into spaces
" tabstop and shiftwidth control tab size (visually)
set autoindent noexpandtab tabstop=4 shiftwidth=4

" Sets the font size and style
set guifont=Consolas:h10

" Makes vim maximized by default
au GUIEnter * simalt ~x

" Prevents the undo file from being created in the directory in which you're compiling
set noundofile

" Lets you click in command prompt
set mouse=a

" I mapped vv to escape so that going from insert to command mode would be easier
imap vv <Esc>

" Maps the 'a' key in command mode so that when you go from command to insert mode, the cursor
" goes one to the right 
noremap <a> <a><r>

" Makes swap file go to the directory below
set backup
set backupdir=C:\VimTempFiles
set backupskip=C:\VimTempFiles\*
set directory=C:\VimTempFiles
set writebackup

" No clue how... but this block of code makes pairs auto-indent and braces come w/ a pair
" Redacted, see github

" When a bracket followed by a carriage return is pressed,
" 1) Press { 
" 2) Create a newline
" 3) Go to normal mode (<Esc>)
" 4) Go up a line (k)
" 5) Create a new line below (o)
" 6) Then delete
" 7) Then create a tab
" The final two steps are needed because by default Vim removes whitespace
" from a line once the cursor moves away from the end and this can be
" annoying.
inoremap {<CR> {<CR>}<Esc>ko<BS><Tab>
inoremap (<CR> (<CR>)<Esc>ko<BS><Tab>
inoremap <<CR> <<CR>><Esc>ko<BS><Tab>
inoremap [<CR> [<CR>]<Esc>ko<BS><Tab>



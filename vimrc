" Run Pathogen
execute pathogen#infect()
syntax on

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Set colorscheme to nova
" colorscheme nova
set termguicolors
colorscheme forest-night
let g:lightline = {'colorscheme' : 'forest_night'}

set background=dark
" set t_Co=256

set undofile
set undodir=~/.vim/undodir

" Set map leader to <space>
let mapleader=" "

" Enables lines numbers
set number

" Max textwidth is 79
set tw=79

" Mouse does not select numbers
set mouse=a

" Yanking goes into the system clipboard "+
map <leader>p "+p
map <leader>y "+y
nnoremap <leader>cv :split ~/.vimrc<cr>
nnoremap <leader>cl :source %<cr>

" Spell langs
nnoremap <F7> :set spelllang=fr<cr>
nnoremap <F8> :set spelllang=en<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maximises current split
set winwidth=180
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Search results are highlighted
set hlsearch
"
" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Maps %% to directory of file currently editing
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"
" opens or views a file in %%
map <leader>e :edit %%
map <leader>v :view %%
map <leader>sp :split %%
map <leader>vs :vsplit %%
"
" Switch between last two files
nnoremap <leader><leader> <c-^>
"
" Fuzzy search (wildmenu for multiple finds)
map <leader>t :GFiles<CR>
nnoremap <leader>f :Files<CR>

set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RAILS SPECIFIC CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

nnoremap <leader>m :make<cr>
nnoremap <leader>s :call StripTrailingWhitespace()<cr>

" Used to open a compiled markdown file
autocmd Filetype markdown nnoremap <leader>o :!xreader %:r.pdf&<CR>
autocmd Filetype tex	  nnoremap <leader>o :!xreader %:r.pdf&<CR>
autocmd Filetype html     nnoremap <leader>o :!open %<CR>
autocmd Filetype java     nnoremap <leader>o :!java %:r<CR>

" Opens the quickfick command after make
autocmd QuickFixCmdPost * copen

" Function to remove trailing whitespaces from the current file
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added to command).
function! SearchMultiLine(bang, ...)
        if a:0 > 0
                let sep = (a:bang) ? '\_W\+' : '\_s\+'
                let @/ = join(a:000, sep)
        endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIOLENT CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Up>    :echo("ARE YOU FUCKING CRAZY?! NO ARROW KEYS, USE HJKL INSTEAD!")<cr>
map <Down>  :echo("ARE YOU FUCKING CRAZY?! NO ARROW KEYS, USE HJKL INSTEAD!")<cr>
map <Left>  :echo("ARE YOU FUCKING CRAZY?! NO ARROW KEYS, USE HJKL INSTEAD!")<cr>
map <Right> :echo("ARE YOU FUCKING CRAZY?! NO ARROW KEYS, USE HJKL INSTEAD!")<cr>



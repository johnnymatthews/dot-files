" GENERAL OPTIONS
" ==============================================================================
syntax on
set noerrorbells		    " Don't make any noises.
set tabstop=4 softtabstop=4	" Use 4 spaces for tabs,
set shiftwidth=4		    " Again, shift stuff but 4 spaces when using tab.
set expandtab			    " Convert a tab to spaces.
set smartindent			    " Try to indent for you, as much as Vim can.
set number relativenumber   " Enable sidebar numbers.
set smartcase			    " Do case sensitive searching until I put in a letter.
set noswapfile			    " Don't create vim.swp files all over the place.
set nobackup			    " Don't need backup, because we'll make our own.
set undodir=~/.vim/undodir	" Tell Vim where to save the undo directory.
set undofile			    " Create an undofile for every file we open/create.
set incsearch			    " While you search you get results.
set cursorline              " Highlights current line.
set background=dark         " Use $this terminal's $background theme.
set mouse=a                 " Scroll with the mouse wheel/touchpad.
" ==============================================================================



" PLUG PLUGINS 
" ==============================================================================

"  Try to install Plug, if it isn't already.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Install these plugins.
call plug#begin('~/.vim/plugged')

    " Fuzzy finder search thingy.
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

    " Preview .md files in browser
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Fancy status line
    Plug 'itchyny/lightline.vim'

    " Nice file manager
    Plug 'preservim/nerdtree'

    " Distraction free Markdown editing
    Plug 'junegunn/goyo.vim'

    " Comment out lines easily. Use `gcc` to comment/uncomment lines.
    Plug 'tpope/vim-commentary'

    " Nice tab management with BarBar.
    Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
    Plug 'nvim-tree/nvim-web-devicons' "\ OPTIONAL: for file icons
    Plug 'romgrk/barbar.nvim'

    " Floating terminal.
    Plug 'voldikss/vim-floaterm'

call plug#end()

" ==============================================================================



" PLUGIN CONFIGURATIONS
" ==============================================================================

" Lightline configuration
" -----------------------
set noshowmode
set laststatus=2
" -----------------------


" Nerdtree configuration
" ----------------------
" Toggle Nerdtree sidebar.
nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" ----------------------


" BarBar tab management keybindings.
" -------------------------------------------------
" Move to previous/next.
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Goto buffer in position.
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" -------------------------------------------------


" Telescope seacher config.
" -------------------------------------------------
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" -------------------------------------------------

" ==============================================================================



" KEY MAPS & KEY HACKS 
" ==============================================================================

" Sets the leader (command key) to spacebar.
let mapleader = " "


" Keep the cursor in the center of the screen.
nnoremap j jzz
nnoremap k kzz


" Toggle word-wrap.
nnoremap <leader>two :set wrap!<CR>


" If you accidentally use W or Q, it doesn't matter.
:command WQ wq
:command Wq wq
:command W w
:command Q q


" Toggle focus mode.
function Focus()
    Goyo
    set linebreak
    hi CursorLine cterm=none
endfunction
map <leader>tfo :call Focus()<CR>


" Toggle git in a new floating terminal window.
map <leader>tgi :FloatermNew lazygit<CR>

" ==============================================================================

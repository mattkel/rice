let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
autocmd VimEnter * PlugInstall
endif

" #####################################################
" ---------------------- plugins ----------------------
" #####################################################

if exists('g:vscode')

  " Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

  " Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

  " indent with visual block using < >
  vmap < <gv
  vmap > >gv

  " center screen in insert mode
  autocmd InsertEnter * norm zz

  " set tab to switch tabs
  nnoremap <Tab> :tabnext<CR>
  nnoremap <S-Tab> :tabprevious<CR>
  " set alt-tab to go to closing { [ ( " '
  nnoremap <A-Tab> %

  " Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  " Compile documents, be it groff/LaTeX/markdown/etc:
  map <leader>c :w! \| !compiler "<c-r>%"<CR>

else
  " ordinary neovim
  call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

  "--- Style ---
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'arzg/vim-colors-xcode'
  Plug 'JaySandhu/xcode-vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'sickill/vim-monokai'
  Plug 'junegunn/seoul256.vim'
  Plug 'ericbn/vim-solarized'
  Plug 'morhetz/gruvbox'
  Plug 'fehawen/cs.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  "Plug 'tribela/vim-transparent'

  "--- Syntax Highlighting ---
  Plug 'ap/vim-css-color'
  Plug 'pangloss/vim-javascript'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'HerringtonDarkholme/yats.vim'

  "--- CoC ---
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "--- HTML / JSX Tags ---
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'

  "--- Git ---
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit'

  "--- Misc ---
  Plug 'scrooloose/nerdcommenter'
  Plug 'vimwiki/vimwiki'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'yggdroot/indentline'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'matze/vim-move'

  call plug#end()

  " #####################################################
  " ---------------------- basics -----------------------
  " #####################################################

  set title
  set go=a
  set mouse=a
  set nohlsearch
  set clipboard+=unnamedplus
  set ic
  set hlsearch
  nnoremap c "_c
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set termguicolors
  set t_Co=256 "set t_Co=16
  set number number "relativenumber

  " cursor lines
  set cursorline! 
  "set cursorcolumn! 
  "set cursorline
  "autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
  "autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

  " tabs
  set tabstop=2
  set shiftwidth=2
  set expandtab

  " Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

  " Enable autocompletion:
  set wildmode=longest,list,full

  " Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " removes the whitespace error section of airline
  let g:airline#extensions#whitespace#enabled = 0

  "let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#left_alt_sep = '|'
  "let g:airline#extensions#tabline#left_sep = ' '

  " #####################################################
  " ------------------- colorscheme ---------------------
  " #####################################################
let g:airline_theme='dark'
set background=dark
colorscheme codedark

  "colorscheme solarized
  "colorscheme PaperColor
  "colorscheme xcode
  "colorscheme xcodelight
  "colorscheme xcodedark
  "let g:seoul256_background = 256
  "let g:seoul256_background = 234
  "colo seoul256

  " --- colorscheme function ---
  let t:dark_bg = 1 " 0 = false, 1 = true
  function! Toggle_background()
    if t:dark_bg == 1
      " set light theme
      let g:airline_theme='light'
      set background=light
      colorscheme xcode
      let t:dark_bg = 0
    else
      " set dark theme
      let g:airline_theme='dark'
      set background=dark
      colorscheme codedark
      let t:dark_bg = 1
    endif
  endfunction

  " --- transparency function ---
  let t:dark_bg = 1 " 0 = false, 1 = true
  function! Toggle_transparency()
    if t:dark_bg == 1
      hi! Normal ctermbg=NONE guibg=NONE
      hi! NonText ctermbg=NONE guibg=NONE
      hi! LineNr ctermbg=NONE guibg=NONE
      let t:dark_bg = 1
    else
      let t:dark_bg = 0
    endif
  endfunction

  " add curly underlines to errors and warnings
  :hi CocErrorHighlight gui=undercurl guisp=red
  :hi CocWarningHighlight gui=undercurl guisp=orange

  " #####################################################
  " ------------------- key mappings --------------------
  " #####################################################

  nnoremap <F12> :call Toggle_background()<CR>
  nnoremap <F10> :call Toggle_transparency()<CR>

  "map <leader>t :TransparentToggle<CR>

  " Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

  " Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

  " Replace ex mode with gq
  map Q gq

  " indent with visual block using < >
  vmap < <gv
  vmap > >gv

  " center screen in insert mode
  autocmd InsertEnter * norm zz

  " center screen when scrolling with j k
  "nnoremap j jzz
  "nnoremap k kzz

  " set tab to switch tabs
  nnoremap <Tab> :tabnext<CR>
  nnoremap <S-Tab> :tabprevious<CR>
  " set alt-tab to go to closing { [ ( " '
  nnoremap <A-Tab> %
  "nnoremap <S-Tab> :bnext<CR>

  " Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  " NERD Commenter
  nmap <C-_> <Plug>NERDCommenterToggle
  vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

  " fzf 
  let g:fzf_layout = { 'down': '30%' }
  nnoremap <C-f> :Files .<CR> 
  inoremap <C-f> <Esc><Esc>:BLines!<CR>
  nnoremap <C-b> :Buffers<CR> 
  map <C-g> <Esc><Esc>:BCommits!<CR>

  "open vimwiki
  map <leader>v :VimwikiIndex

  " Coc Explorer
  noremap <leader>f :CocCommand explorer<CR>

  " Goyo plugin for makeing text more readable:
  map <leader>g :Goyo \| set linebreak<CR>

  " Compile documents, be it groff/LaTeX/markdown/etc:
  map <leader>c :w! \| !compiler "<c-r>%"<CR>

  " Open corresponding .pdf/.html or preview
  map <leader>p :!opout <c-r>%<CR><CR>

  " Spell-check:
  map <leader>o :setlocal spell! spelllang=en_au<CR>

  " Check file in shellcheck:
  map <leader>s :!clear && shellcheck -x %<CR>

  " Markdown Preview toggle and auto close preview
  "nmap <leader>m <Plug>MarkdownPreviewToggle
  let g:mkdp_auto_start = 1
  let g:mkdp_auto_close = 1

  " not sure what this does
  "inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  "inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

  " #####################################################
  " ------------------ plugin configs -------------------
  " #####################################################

  " --- Indent Line
  let g:javascript_plugin_jsdoc = 1
  let g:indentLine_char_list = ['¦']
  "let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " --- Goyo by default for mutt writing
  autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
  autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

  function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  endfunction

  function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif
  endfunction

  autocmd! User GoyoEnter call <SID>goyo_enter()
  autocmd! User GoyoLeave call <SID>goyo_leave()

  " --- VimWiki - Ensure files are read as what I want:
  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
  autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex

  " --- Close Tag
  "filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx'

  " filenames like *.xml, *.xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx'

  " filetypes like xml, html, xhtml, ...
  " These are the file types where this plugin is enabled.
  let g:closetag_filetypes = 'html,xhtml,jsx,js,tsx'

  " filetypes like xml, xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx'

  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  let g:closetag_emptyTags_caseSensitive = 1

  " Disables auto-close if not in a "valid" region (based on filetype)
  let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'

  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>'

  autocmd BufWritePost ~/.tmp_file !cd ~/; rm ~/.tmp_file

  map <leader>s :!saveas <c-r>%<CR><CR>

  " #####################################################
  " -------------- make suckless suck less --------------
  " #####################################################

  " Recompile dwm on config edit.
  autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install

  " Recompile dwmblocks on config edit
  autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/s-tools/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

  " Recompile dmenu on config edit.
  autocmd BufWritePost ~/.local/src/dmenu/config.h !cd ~/.local/src/s-tools/dmenu/; sudo make install

  " Recompile st on config edit.
  autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/s-tools/st/; sudo make install

  " Recompile slock on config edit.
  autocmd BufWritePost ~/.local/src/slock/config.h !cd ~/.local/src/s-tools/slock/; sudo make install

  " Recompile xmenu on config edit.
  autocmd BufWritePost ~/.local/src/xmenu/config.h !cd ~/.local/src/s-tools/xmenu/; sudo make install

endif

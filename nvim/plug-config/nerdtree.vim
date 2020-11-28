"let g:NERDTreeWinSize=25 
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlit

" Open the current buffer file in nerdtree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if ( winnr( "$" ) == 1 && exists( "b:NERDTree" ) && b:NERDTree.isTabTree() ) | q | endif

nnoremap <leader>q :NERDTreeToggle<CR>


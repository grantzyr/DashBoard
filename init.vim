""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Vim-Plug Setting                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'neoclide/coc.nvim' "LS
Plug 'neoclide/coc-git' "git 
Plug 'neoclide/coc-pairs' "括号补全
Plug 'vim-airline/vim-airline' "状态栏
Plug 'morhetz/gruvbox' "gruvbox主题
Plug 'Yggdroot/indentLine' "可视化缩进

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              neoclide/coc.nvim                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup "Some servers have issues with backup files
set nowritebackup "some servers have issues with backup files



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          vim-airline/vim-airline                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='gruvbox' "设置airline主题和vim主题适配


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              morhetz/gruvbox                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bg=dark "设置为dark模式


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Yggdroot/indentLine                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_guide_size = 1 "指定缩进线的尺寸
let g:indent_guides_start_level = 2 "指定从第二层开始可视化显示缩进
"let g:autopep8_disable_show_diff = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu "显示行数
colo gruvbox "设置主题
set cursorline "突出当前行
syntax on "语法检测
"set mouse=a
set encoding=utf-8 "中文支持
set updatetime=300
"set cursorcolumn "突出当前列
"用Tab和S-Tab来补全
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


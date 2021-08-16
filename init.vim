"                                                                  "Grant"
"=========================================================================="
" "CONTENTS                                                  vim-contents"

" "01. Plug setting ............................................ s-plugin"
" "02. General setting ....................................... s-gsetting"
" "03. General mappings ..................................... s-gmappings"


"=========================================================================="
" "PLUG SETTING                                                  s-plugin"

" 00. Main ..................................................... plug-main
" 01. Language service coc ...................................... plug-coc
" 02. Airline ............................................... plug-airline
" 03. Vim theme ............................................. plug-gruvbox
" 04. Indent line ........................................ plug-indentline
" 05. Markdown preview .............................. plug-markdownpreview
" 06. Comment ......................................... plug-nerdcommenter
" 07. File management nerdtree ............................. plug-nerdtree

"*************************************************************************"
" MAIN                                                          plug-main

call plug#begin()

Plug 'neoclide/coc.nvim' "LS
Plug 'vim-airline/vim-airline' "状态栏
Plug 'morhetz/gruvbox' "gruvbox主题
Plug 'Yggdroot/indentLine' "可视化缩进
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "实时预览markdown文件
Plug 'scrooloose/nerdcommenter' "注释插件 
Plug 'preservim/nerdtree' "文件管理，目录树

call plug#end()

"**************************************************************************"
" LANGUAGE SERVICE                                                plug-coc
" 01. neoclide/coc.nvim
set nobackup "Some servers have issues with backup files
set nowritebackup "some servers have issues with backup files

"**************************************************************************"
" POWERLINE                                                   plug-airline
" 01. vim-airline/vim-airline
let g:airline_powerline_fonts=1  "支持 powerline 字体
let g:airline_theme='dark' "设置airline主题
let g:airline#extensions#tabline#enabled=1 "显示窗口tab和buffer
let g:airline_theme='gruvbox' "设置airline主题和vim主题适配
" let g:airline_stl_path_stl_path_style " Display a short path in statusline 显示简短路径(302 in help file)
" let g:airline_section_c_only_filename=1 " Display a only file name in statusline

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr = ' ℅:'

"**************************************************************************"
" THEME                                                       plug-gruvbox
" 01. morhetz/gruvbox

"**************************************************************************"
" INDENTLINE                                               plug-indentline
" 01. Yggdroot/indentLine
let g:indent_guides_guide_size=1 "指定缩进线的尺寸
let g:indent_guides_start_level=2 "指定从第二层开始可视化显示缩进
" let g:autopep8_disable_show_diff=1

"**************************************************************************"
" MARKDOWN                                            plug-markdownpreview
" 01. iamcco/markdown-preview.nvim
let g:mkdp_auto_start=1 "设置打开markdown自动启动preview

"**************************************************************************"
" COMMENT                                               plug-nerdcommenter
" 01. scrooloose/nerdcommenter
"\cc 注释当前行和选中行
"\cn 没有发现和\cc有区别
"\c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"\cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"\ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
"\cs 添加性感的注释，代码开头介绍部分通常使用该注释
"\cy 添加注释，并复制被添加注释的部分
"\c$ 注释当前光标到改行结尾的内容
"\cA 跳转到该行结尾添加注释，并进入编辑模式
"\ca 转换注释的方式，比如：/**/和//
"\cl \cb 左对齐和左右对其，左右对其主要针对/**/
"\cu 取消注释

let g:NERDSpaceDelims=1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs=1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign='left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines=1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace=1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines=1 " Enable NERDCommenterToggle to check all selected lines is commented or not 

"**************************************************************************"
" FILEMANAGEMENT                                             plug-nerdtree
" 01. preservim/nerdtree

"=========================================================================="
" "GENERAL SETTING                                             s-gsetting"

" 01. Global ............................................. gsetting-global

"**************************************************************************"
" GLOBAL                                                   gsetting-global
" set leader key
" let g:mapleader = "\<Space>"
set bg=dark "设置背景为dark
set nu "显示行数
set tabstop=4 "设置tab长度，默认为8
set shiftwidth=4 "设置每级缩进长度，和tab长度保持一致
colo gruvbox "设置主题
set cmdheight=1 "留出更多空间显示信息 2
" set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set laststatus=2 "显示状态栏 0: 不显示 1: 多个tab时显示 2: 总是显示
" set showcmd "显示cmd
set showtabline=2 "显示tab
syntax on "语法检测
set mouse=a "设置可以使用鼠标
set encoding=utf-8 "encoding display
set updatetime=300 "Faster completion
set timeoutlen=500 "default is 1000 按键等待时间
set nocompatible 
set clipboard=unnamedplus "任意地方复制粘贴
set t_Co=256 "设置色彩256
set cursorline "突出当前行
"set cursorcolumn "突出当前列
set nowrap "显示长句在一行
set formatoptions-=cro "关闭注释续行

"=========================================================================="
" "GENERAL MAPPINGS                                           s-gmappings"

" 01. Global ............................................ gmappings-global
" 02. Python ............................................ gmappings-python
" 03. markdown ........................................ gmappings-markdown

"**************************************************************************"
" GLOBAL                                                  gmappings-global
"用Tab和S-Tab来补全
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" use jk or kj to instead of Esc
inoremap jk <Esc>
inoremap kj <Esc> 

" set ctrl + m as <Esc>+o
inoremap <C-m> <Esc>o

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

"**************************************************************************"
" PYTHON                                                  gmappings-python
" autocmd FileType python

" Ctrl + i 运行python文件
autocmd FileType python nnoremap <buffer> <C-i> :!python % <CR>

"**************************************************************************"
" MARKDOWN                                              gmappings-markdown
" autocmd FileType markdown


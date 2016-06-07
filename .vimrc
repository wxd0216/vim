" luchaodong
" 20160606
" monkey year horse month

set smartindent

" 自动断行
"set lbr
"set fo+=mB

" Tab键的宽度
set tabstop=8
" 统一缩进为8
set softtabstop=8
set shiftwidth=8

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 使用空格代替制表符
"set expandtab
" 不使用空格代替制表符
set noexpandtab
" set expandtab后，设置smarttab，在删除tab（4个空格）只需以下Backspace
set smarttab

" 显示括号配对情况
set sm
" 设置选择文本时候，包括光标所在
set selection=inclusive
" 右键单击弹出快捷菜单
set mousemodel=popup

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

" 插件管理
execute pathogen#infect()

let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:fencview_autodetect=0


set rtp+=$GOROOT/misc/vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" 显示标尺
set cul
set cuc
" 插入模式关闭
autocmd InsertLeave * se cul
autocmd InsertEnter * se nocul
autocmd InsertLeave * se cuc
autocmd InsertEnter * se nocuc

set shortmess=atI               " 启动的时候不显示那个援助乌干达儿童的提示  
set go=                         " 不要图形按钮  

"color desert                   " 设置背景主题  
color ron                       " 设置背景主题  
"color torte                    " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  

set ruler                       " 显示标尺  
set showcmd                     " 输入的命令显示出来，看的清楚些  
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2                " 启动显示状态行(1),总是显示状态行(2)  
set foldenable                  " 允许折叠  
"set foldmethod=manual          " 手动折叠  

"显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" 自动缩进
set autoindent
set cindent

" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch

" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on

" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目

" markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" newfiletitle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 

func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
        elseif &filetype == 'python'
                call setline(1,"#!/usr/bin/env python")
                call append(line("."),"# coding=utf-8")
	        call append(line(".")+1, "") 

        elseif &filetype == 'ruby'
                call setline(1,"#!/usr/bin/env ruby")
                call append(line("."),"# encoding: utf-8")
	        call append(line(".")+1, "")

	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: orient lu") 
		call append(line(".")+2, "	> Mail: lcdsdream@126.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif

	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" keyboardmap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <C-w> <C-w>w
map <C-w>h <C-h>
map <C-w>j <C-j>
map <C-w>k <C-k>
map <C-w>l <C-l>

" 全选
map <C-A> ggVG$"+y

" 去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
" 比较文件  
nnoremap <C-F2> :vert diffsplit 


" 列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
" 打开树状文件目录  
map <C-F3> \be 

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>

"代码格式优化化
map <F6> :call FormartSrc()<CR><CR>

"C,C++的调试
map <F8> :call Rungdb()<CR>


nmap <silent> <F9> <ESC>:Tlist<RETURN>


" 代码格式化
map <F12> gg=G

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>


imap <C-a> <Esc>^
imap <C-e> <Esc>$


" tab 切换
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>


imap <C-j> <ESC>

"set clipboard=unnamed
nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"



func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
"        exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
	endif
endfunc

func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

"mrkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" othersetting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 
set completeopt=preview,menu 
"共享剪贴板  
"set clipboard+=unnamed 
"自动保存
set autowrite

set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

" 自动设置目录为当前文件所在目录
"set autochdir 

set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界 (到行尾自动跳到下一行)
"set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

set completeopt=longest,menu



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置tags  
set tags=tags;  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag list (ctags) 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"默认打开Taglist 
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Auto_Open=0 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的

" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
nmap tl :Tlist<cr>


"python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

autocmd FileType python set omnifunc=pythoncomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" " vim plugin bundle control, command model
" "     :BundleInstall     install 安装配置的插件
" "     :BundleInstall!    update  更新
" "     :BundleClean       remove plugin not in list 删除本地无用插件
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'L9'
" 集成git， 命令行中 ：Gdiff 看看
Bundle 'tpope/vim-fugitive'
" 缩进对齐线
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
" 快速搜索
Bundle 'FuzzyFinder'
"文件模糊查找
Bundle 'ctrlp.vim'
" 模糊搜索当前文件中所有函数
Bundle 'tacahiroy/ctrlp-funky'
"模糊搜索本地修改的文件
Bundle 'ctrlp-modified.vim'
"自动补全
Bundle 'Auto-Pairs'
"剪贴 外间<->vim 
Bundle 'CaptureClipboard'

Bundle 'python-imports.vim'
"global mark
Bundle 'last_edit_marker.vim'

Bundle 'synmark.vim'

Bundle 'SQLComplete.vim'

Bundle 'Vim-Script-Updater'
"code注释
Bundle 'The-NERD-Commenter'
" 远程协作
"Bundle 'FredKSchott/CoVim'

"载入文件类型插件
filetype plugin on
filetype plugin indent on     " required!

"ctrlp设置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

let NERDTreeIgnore=['\.pyc']


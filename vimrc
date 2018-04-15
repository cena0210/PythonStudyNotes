

" ==========================================
" vim-plug 插件管理和配置项
" ==========================================
call plug#begin('~/.vim/plugged')

"-----基础插件
Plug 'vim-airline/vim-airline'              "增强状态栏
Plug 'vim-airline/vim-airline-themes'       "状态栏主题
Plug 'altercation/vim-colors-solarized'		"solarized主题
Plug 'kshenoy/vim-signature'			    "显示marks
Plug 'jiangmiao/auto-pairs'			        "符号补全
Plug 'ntpeters/vim-better-whitespace'		"显示且去除多余空格
Plug 'scrooloose/nerdcommenter'			    "快速注释
Plug 'scrooloose/nerdtree'			        "目录栏
Plug 'w0rp/ale'					            "动态检测
Plug 'ctrlpvim/ctrlp.vim'			        "模糊搜索
Plug 'tpope/vim-repeat'				        "重复插件操作
Plug 'tpope/vim-surround'			        "快速包裹

"-----增强插件带补全
" Plug 'majutsushi/tagbar'			        "tag栏
" Plug 'Valloric/YouCompleteMe'			    "代码补全
" Plug 'SirVer/ultisnips'				        "代码段插入
" Plug 'honza/vim-snippets'			        "代码段资料
" Plug 'alvan/vim-closetag'			        "标签补全
" Plug 'thinca/vim-quickrun'			        "快速运行
" Plug 'junegunn/vim-easy-align'			    "对齐插件
" Plug 'airblade/vim-gitgutter'			    "git插件


call plug#end()

" ==========================================
" 基础配置
" ==========================================

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on

" history存储容量
set history=2000

" 检测文件类型
filetype on

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 允许插件
filetype plugin on

" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread

" 启动的时候不显示提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup

" 关闭交换文件
set noswapfile

" 列线
"set cursorcolumn

" 行线
"set cursorline

" 退出后依然保持vim文本信息在终端
set t_ti= t_te=

" 关闭鼠标
set mouse-=a

" 启用鼠标
"set mouse=a

" 更改终端名称
set title

" 记录关闭时打开缓冲区的信息
set viminfo^=%

" 正则magic模式，简化某些/
set magic

" 去除有关vi一致性模式
set nocompatible

" 配置退格键
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 隐藏文件类型
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn



" ==========================================
" 排版/界面设置
" ==========================================

" 显示当前的行号列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=10

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2

" 显示行号
set number

" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
set matchtime=2

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
set smartindent
" 打开自动缩进
set autoindent

" tab相关变更
" 设置Tab键的宽度 单位空格
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" 开启时在行首按TAB增加sw/ts个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时取整
set shiftround

" 放弃缓冲区时hidden模式
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
" set nrformats=

"" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
"set relativenumber number
"au FocusLost * :set norelativenumber number
"au FocusGained * :set relativenumber
"" 插入模式下用绝对行号, 普通模式下用相对
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set norelativenumber number
"  else
"    set relativenumber
"  endif
"endfunc
"nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
if &term =~ '256color'
  set t_ut=
endif



" ==========================================
" 文件编码/格式
" ==========================================

" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 中文帮助
set helplang=cn

" 中文菜单
set langmenu=zh_CN.UTF-8

" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" 使用unix标准文件类型
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B




" ==========================================
" 其他设置
" ==========================================

" vimrc文件修改之后自动加载, windows
"autocmd! bufwritepost _vimrc source %

" vimrc文件修改之后自动加载, linux
"autocmd! bufwritepost .vimrc source %

" 自动补全配置
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"" 在quickfix窗口中，<CR>用于跳转到下面的错误
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"" quickfix窗口s/v在分割窗口中打开 重新射影快捷键
"autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
"autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



" ==========================================
" 文件类型
" ==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 在php中禁用showmatch模式
au BufWinEnter *.php set mps-=<:>

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif



" ==========================================
" 快捷键设定
" ==========================================

"-----主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"set swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"-----F1 - F6 设置

" F1 废弃,防止调出系统帮助
noremap <F1> <Esc>"

" <F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 分屏窗口移动ctrl+j k h l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" 回复/缩放窗口<leader>z
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" 行首行尾更改为H L
noremap H ^
noremap L $


" 射影；号为:
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


"-----搜索相关
" 射影空格为快速文内搜索
map <space> /
" 进入搜索默认进入正则模式
nnoremap / /\v
vnoremap / /\v

" 搜索选择项为屏幕中心位置
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮<leader>/
noremap <silent><leader>/ :nohls<CR>

" 开关 # *
nnoremap # *
nnoremap * #

" python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


"-----buffer相关
" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

"-----标签操作
" 标签切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的标签
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 在活动标签和最后一个活动标签之间切换 第一个标签总是1
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建标签 Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


"-----选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" Y从当前位置直接复制到行尾
map Y y$

" 复制选中区到系统剪切板中<leader>y
vnoremap <leader>y "+y

" 自动跳转到选择尾部
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" 全选<leader>va
map <Leader>va ggVG

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

" 选中段落<leader>v
nnoremap <leader>v V`}

" 设映w!!为sudo 强制写入
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
"inoremap kj <Esc>

" 单行滚动改为双行
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" 快速退出<leader>q
nnoremap <leader>q :q<CR>

" 快速保存<leader>w
nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" U为ctrl+r操作，对应u
nnoremap U <C-r>



" ==========================================
" 主题设定
" ==========================================

" gui-vim额外的配置
" if has("gui_running")
    " set guifont=Monospace:h12
    " if has("gui_gtk2")   "GTK2
        " set guifont=Monospace\ 12
    " endif
    " set guioptions-=T
    " set guioptions+=e
    " set guioptions-=r
    " set guioptions-=L
    " set guitablabel=%M\ %t
    " set showtabline=1
    " set linespace=2
    " set noimd
" endif

" theme主题
set t_Co=256
if has("gui_running")
    syntax enable
    set background=dark
    colorscheme solarized
else
    colorscheme default
endif

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" 防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



" ==========================================
" 基础插件配置
" ==========================================

"-----airline配置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" 是否打开tabline
" let g:airline#extensions#tabline#enabled = 1

" 括号匹配高亮
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" 可视化缩进
"let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
"let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
"let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" 状态栏主题
if has("gui_running")
"    let g:airline_theme='solarized'
"    let g:airline_solarized_bg='dark'
    let g:airline_theme='dark'
else
    let g:airline_theme='kolor'
endif

let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"


"-----signature用法

"  mx           添加一个'x'标记 在最左边栏显示
"  dmx          删除'x'标记 标记范围可以是a-zA-Z
"
"  m,           放置一个可用标记
"  m.           如果当前行有标记则删除标记，否则添加一个可用标记
"  m-           删除当前行的所有标记
"  m<Space>     删除当前缓冲区的所有标记
"  ]`           跳到下一个标记处
"  [`           跳到上一个标记处
"  ]'           跳转到下一个标记的行首
"  ['           跳转到上一个标记的行首
"  `]           按照字母顺序跳转到下一个标记
"  `[           按照字母顺序跳转到上一个标记
"  ']           按照字母顺序跳转到下一个标记行首
"  '[           按照字母顺序跳转到上一个标记行首
"  m/           新窗口打开标记列表
"
"  m[0-9]       特殊符号标记 !@#$%^&*()
"  m<S-[0-9]>   移除特殊符号标记
"  ]-           跳转到同类型符号的下一个标记
"  [-           跳转到同类型符号的上一个标记
"  ]=           跳转到任何类型符号的下一个标记
"  [=           跳转到任何类型符号的上一个标记
"  m?           打开特殊符号标记的列表
"  m<BS>        移除所有特殊标记


"-----vim-better-whitespace配置

" 显示多余空格
let g:better_whitespace_enabled=1

" 保存时自动删除空格
"let g:strip_whitespace_on_save=1

" 清除空格绑定
nnoremap <silent> <Leader><space> :StripWhitespace<CR>

" 清除指定文件类型的空格
"autocmd FileType <desired_filetypes> EnableStripWhitespaceOnSave


"-----nerdcommenter配置

" 默认情况下注释后添加空格
let g:NERDSpaceDelims=1

" 设置python使用备用注释符
let g:NERDAltDelims_python = 1


"-----nerdtree配置

" 快捷键设定
map <Leader>n :NERDTreeToggle<CR>

" 打开位置
let g:NERDTreeWinPos="left"

" 打开窗口宽度
let g:NERDTreeWinSize=25

" 显示数量栏
let g:NERDTreeShowLineNumbers=1

" 打开文件时关闭
let NERDTreeQuitOnOpen=1

" 显示书签
let NERDTreeShowBookmarks=1

" 关闭窗口时自动关闭NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 图标修改
let g:NERDTreeDirArrowExpandable='♥'
let g:NERDTreeDirArrowCollapsible='♥'

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let NERDTreeHighlightCursorline=1

" 隐藏文件类型设定
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]

" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0


"-----ale配置

" 始终开启标识列
let g:ale_sign_column_always = 1
" 开启ale高亮
let g:ale_set_highlights = 1

let g:ale_linters = {
\   'python': ['flake8'],
\}

" E501 -> 120 chars
let g:ale_python_flake8_args="--ignore=E114,E116,E131 --max-line-length=120"
" 自定义图标
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

" 自带状态栏整合
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" 错误跳转
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <Leader>en <Plug>(ale_next_wrap)

nnoremap <silent> <Leader>ec :ALEToggle<CR>

" <Leader>s 错误列表
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        lopen
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>

" 标志栏风格清除
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermfg=196
highlight ALEWarningSign ctermfg=191


"-----ctrlp配置

" 快速搜索当前目录下的文件<Leader>p
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

" <Leader>f搜索MRU文件
map <leader>f :CtrlPMRU<CR>

" <Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>

" 设置搜索时忽略的文件
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"    \ }
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_match_window_bottom=1

" 修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0

" 设置MRU最大条目数为500
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"调用ag进行搜索提升速度，同时不使用缓存文件
"if executable('ag')
"  set grepprg=ag\ --nogroup\ --nocolor
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"  let g:ctrlp_use_caching = 0
"endif



" ==========================================
" 扩展插件配置
" ==========================================

" source ~/.vimrc.ex


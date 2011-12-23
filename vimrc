scriptencoding utf-8

" -------------------
" Bundler
" -------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"misc
Bundle 'clones/vim-l9'
Bundle 'FuzzyFinder'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimfiler'
"Bundle 'Shougo/vimshell'
"Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ambicmd'
Bundle 'surround.vim'
Bundle 'css_color.vim'
Bundle 'mattn/zencoding-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'project.tar.gz'
Bundle 'unite.vim'
Bundle 'vim-jp/vimdoc-ja'

"colorscheme
"Bundle 'billw.vim'

"ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'astashov/vim-ruby-debugger'

"js
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'
Bundle 'kchmck/vim-coffee-script'

"php
Bundle 'cakephp.vim'

"git
Bundle 'motemen/git-vim'

filetype indent plugin on

" -------------------
" color
" -------------------
syntax on
if has('gui_macvim')
  set showtabline=2
  set imdisable
  set transparency=10
  set antialias
  set guifont=Monaco:h13
  "colorscheme billw
  "colorscheme railscasts
  colorscheme macvim
endif

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

highlight LineNr ctermfg=lightgrey   " 行番号
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey " 特殊記号
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
highlight TabLine     cterm=NONE ctermfg=black ctermbg=white
highlight TabLineSel  cterm=bold ctermfg=white ctermbg=black
highlight TabLineFill ctermfg=white
highlight Search ctermbg=green
" ポップアップの配色
highlight Pmenu ctermbg=darkblue
highlight PmenuSel ctermbg=darkred
highlight PmenuSbar ctermbg=darkblue

" disable bold font
"if !has('gui_running')
"    set t_Co=8 t_md=
"endif

" -------------------
" encoding
" -------------------
"enc/fencs/ffs
set encoding=utf-8
set fileencodings=utf-8,cp932,eucjp,iso2022jp
set fileformats=unix,dos,mac


" -------------------
" 基本設定
" -------------------
set ambiwidth=double " 記号(※とか△とか)入力時にカーソルがズレないように設定
set autoindent
set autoread                   " 外部のエディタで編集中のファイルが変更されたら再読み込み
set backspace=indent,eol,start
set nobackup
"set backupdir=~/.Trash
set clipboard+=autoselect      " visual selection -> clipboard
"set clipboard+=unnamed         " yank -> clipboard
set complete+=k                " 辞書ファイルからの単語補完
set cursorline
set display=lastline
set foldmethod=syntax
set foldlevel=100
set formatoptions+=r
set helplang=en,ja
set laststatus=2
set list
set listchars=tab:»\
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set mouse=a
set nobackup
set noexpandtab            " tab -> space 置換なし
set number
set ruler
set showcmd
set showmatch              " 対応する括弧を表示
set smartindent
set suffixes=.bak,~,.swp
set tabstop=4 shiftwidth=4
set ttimeoutlen=0
set virtualedit=block
set visualbell t_vb=       " no beep
set wildmode=list,full     " コマンドライン補完


" -------------------
" ステータスライン
" -------------------
"set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
set statusline=%y%<%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%f%m%r%h%w%=<%l,%c%V>%6p%%
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

" -------------------
" 補完
" -------------------
set wildmode=list:longest,list:full " list:longest 複数あれば全て羅列・共通最長まで補完
                                    " list:full 複数あれば全て羅列・最初のマッチのマッチを補完
" -------------------
" 検索
" -------------------
set hlsearch     " ハイライト
"set nohlsearch
set ignorecase   " 大文字小文字区別無し
set incsearch    " インクリメンタルサーチ
set smartcase    " 大文字が含まれていれば区別して検索

" -------------------
" mapping
" -------------------
"noremap ; :
"noremap : ;
"nnoremap + <C-w>+
"nnoremap _ <C-w>-
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

nnoremap <C-p> :set paste<CR>i
"nnoremap <S-p> :set paste<CR>i
nmap <silent> <C-N> :noh<CR>

"補完
imap <C-o> <C-x><C-o>
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap <silent> <C-p> <Space>=> <RIGHT>

"Buffer
nmap <Space>b :ls<CR>:buffer
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>

"Tabs
"nnoremap <Space>t t
"nnoremap <Space>T T
"nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

"fuzzyfinder
"nnoremap <Space>f f
"nnoremap <Space>F F
"nnoremap f <Nop>
nnoremap <unique> <silent> fb :<C-u>FufBuffer!<CR>
nnoremap <unique> <silent> ff :<C-u>FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <unique> <silent> <C-t> :<C-u>FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <unique> <silent> fm :<C-u>FufMruFile!<CR>
nnoremap <unique> <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
nnoremap <unique> <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FufFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <unique> <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>

"ctags
nnoremap <C-]><C-]> <C-t>

" -------------------
" filetype
" -------------------
autocmd FileType c,cpp,perl,sh set ts=4 sw=4 expandtab
autocmd FileType java set ts=2 sw=2 expandtab
autocmd FileType python set ts=4 sw=4 expandtab
autocmd FileType ruby,eruby,cucumber set nowrap ts=2 sw=2 expandtab
autocmd FileType html set ts=2 sw=2 expandtab ft=xhtml
autocmd FileType javascript set ts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd BufNewFile,BufRead *.java set ft=java
autocmd BufNewFile,BufRead *.ejs set ft=html

"rails
autocmd BufNewFile,BufRead app/**/*.rhtml set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.erb set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.haml set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb set fenc=utf-8

"java
:let java_highlight_all=1
:let java_highlight_debug=1
:let java_space_errors=1
:let java_highlight_functions=1


" -------------------
" autocmd
" -------------------
"Insert mode抜けたら nopaste
autocmd InsertLeave * set nopaste

"自動的に QuickFix リストを表示する
autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickFixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

"前回表示位置を記憶
autocmd BufRead * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

augroup SkeletonAu
  autocmd!
  autocmd BufNewFile *.html 0r $HOME/.vim/templates/skel.html
augroup End

" 相対パスを設定
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/


" -------------------
" function
" -------------------
"行頭のスペースの連続をハイライト
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=underline ctermbg=darkblue
endf
"全角スペースをハイライト
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"行末スペースをハイライト
function! TrailedSpaceHightlight()
    syntax match TrailedSpace "[ \t]\+$" display containedin=ALL
    highlight TrailedSpace term=underline ctermbg=Red guibg=Red
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        "autocmd BufNew,BufRead * call SOLSpaceHilight()
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
        autocmd BufNew,BufRead * call TrailedSpaceHightlight()
    augroup END
endif

:function! HtmlEscape()
silent s/&/\&amp;/eg
silent s/</\&lt;/eg
silent s/>/\&gt;/eg
:endfunction

:function! HtmlUnEscape()
silent s/&lt;/</eg
silent s/&gt;/>/eg
silent s/&amp;/\&/eg
:endfunction

" -------------------
" plugin
" -------------------
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"vim-ruby
"Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let ruby_space_errors = 1

"vim-rails
let g:rails_level=4
let g:rails_statusline=1
function! Rspec ()
  let rails_spec_pat = '\<spec/\(models\|controllers\|views\|helpers\)/.*_spec\.rb$'
  if expand('%:p') =~ rails_spec_pat
    exe '!ruby script/spec -fn -c %:p -l '.line('.')
    "exe '!rake spec SPEC="'.expand('%:p').'" RSPECOPTS="-fs -c -l '.line('.').'"'
  else
    :!rspec -fn -c %
  endif
endfunction

au BufRead,BufNewFile *_spec.rb :command! Rs :call Rspec()

"rspec on quickrun
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command':'rspec'}

augroup MyRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"fuzzy_finder
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

"smartchr
"inoremap <expr> <buffer> {  smartchr#loop('{', '#{', '{{{')
"inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
"inoremap <buffer> <expr> <S-=> smartchr#loop(' + ', '+')
"inoremap <buffer> <expr> - smartchr#loop(' - ', '-')
"inoremap <buffer> <expr> , smartchr#loop(', ', ',')
"inoremap <buffer> <expr> . smartchr#loop('.', '<%=  %>', '<%  %>')
"inoremap <buffer> <expr> . smartchr#loop('.', '<%=  %><LEFT><LEFT><LEFT>', '<%  %><LEFT><LEFT><LEFT>')

"rsense
"let g:rsenseHome = "/Users/snoozer/lib/rsense-0.3"
"let g:rsenseUseOmniFunc = 1

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_enable_smart_case = 1
"" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
"" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:NeoComplCache_EnableSkipCompletion = 0
if !exists('g:NeoComplCache_OmniPatterns')
  let g:NeoComplCache_OmniPatterns = {}
endif
let g:NeoComplCache_OmniPatterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-e> neocomplcache#cancel_popup()

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"snippets
"let g:NeoComplCache_SnippetsDir = '~/.vim/snippets'
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


"ambicmd
cnoremap bi<CR> :BundleInstall
cnoremap bu<CR> :BundleInstall!

"indent-guids
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_color_change_percent = 30
"let g:indent_guides_guide_size = 1
""set background=dark
"hi IndentGuidesOdd  ctermbg=grey
"hi IndentGuidesEven ctermbg=darkgrey


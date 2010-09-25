filetype indent plugin on

" -------------------
" color
" -------------------
syntax on

highlight LineNr ctermfg=lightgrey
"hightlight LineNr ctermfg=darkyellow    " 行番号
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey
"highlight SpecialKey ctermfg=grey " 特殊記号
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" ポップアップの配色
highlight Pmenu guibg=#666666
highlight PmenuSel guibg=#8cd0d3 guifg=#666666
highlight PmenuSbar guibg=#333333

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
set autoread
set backspace=indent,eol,start
set backupdir=~/.Trash
set clipboard+=autoselect      " visual selection -> clipboard
set clipboard+=unnamed         " yank -> clipboard
set cursorline
set display=lastline
set laststatus=2
set list
set listchars=tab:»\
set mouse=a
set nobackup
set nocompatible           " vi機能優先しない
set noexpandtab            " tab -> space 置換なし
set number
set ruler
set showcmd
set showmatch              " 対応する括弧を表示
set smartindent
set tabstop=4 shiftwidth=4
set ttimeoutlen=0
set virtualedit=block
set visualbell t_vb=       " no beep


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
nnoremap + <C-w>+
nnoremap _ <C-w>-
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
" 補完
imap <C-o> <C-x><C-o>
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"fuzzyfinder
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <C-t> :FufFile!<CR>
"nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>

" -------------------
" autocmd
" -------------------
" 挿入モード時、paste オプションを解除する
"autocmd InsertLeave * set nopaste

" 自動的に QuickFix リストを表示する
autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickFixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

" -------------------
" filetype
" -------------------
au FileType c,cpp,perl set ts=4 sw=4 expandtab
au FileType python set ts=4 sw=4 expandtab
au FileType ruby,eruby,cucumber set nowrap ts=2 sw=2 expandtab
au FileType html set filetype=xhtml

" -------------------
" function 
" -------------------
"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=underline ctermbg=darkblue
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        "autocmd BufNew,BufRead * call SOLSpaceHilight()
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif

" -------------------
" plugin 
" -------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"vim-ruby
"Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let ruby_space_errors = 1

"vim-rails
function! Rspec ()
  let rails_spec_pat = '\<spec/\(models\|controllers\|views\|helpers\)/.*_spec\.rb$'
  if expand('%:p') =~ rails_spec_pat
    exe '!ruby script/spec -fn -c %:p -l '.line('.')
    "exe '!rake spec SPEC="'.expand('%:p').'" RSPECOPTS="-fs -c -l '.line('.').'"'
  else
    :!spec -fn -c %
  endif
endfunction

au BufRead,BufNewFile *_spec.rb :command! Rs :call Rspec()

"fuzzy_finder
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'


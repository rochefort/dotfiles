" -----------------
" 色の設定
" -----------------
syntax on
"color setting by .gvimrc
"colorscheme ir_black

set hlsearch			" 検索文字列
hi LineNr ctermfg=lightgrey
"hi LineNr ctermfg=darkyellow    " 行番号
hi NonText ctermfg=darkgrey
hi Folded ctermfg=blue
hi SpecialKey cterm=underline ctermfg=darkgrey
"highlight SpecialKey ctermfg=grey " 特殊記号
"
"for autocomplpop
"" ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

" 全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
"match ZenkakuSpace /　/

" -----------------
" 日本語設定
" -----------------
set enc=utf-8
set fenc=utf-8
"set fencs=iso-2022-jp,euc-jp,cp932

" -------------------
" 検索
" -------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase
" 検索文字のハイライトをしない
set nohlsearch
" インクリメンタルサーチ
set incsearch

" -------------------
" ステータスライン
" -------------------
set laststatus=2
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
hi StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white


" -------------------
" ヘルプ設定
" -------------------
helptags $HOME/.vim/doc

" -------------------
" その他
" -------------------
set title
set autoindent
set nocompatible
set backup
set backupdir=${HOME}/.Trash
set number
set ruler
set showmatch
set showcmd
set noexpandtab		" tab -> space 置換なし

"---
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.rhtml :setf ruby
augroup END
"---

filetype on
filetype indent on
filetype plugin on
autocmd FileType c,cpp,perl set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

" rubycomplete.vim
autocmd FileType ruby,eruby set tabstop=2 sw=2 expandtab omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType html set filetype=xhtml
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
set shiftwidth=4
set tabstop=4

" autocomplpop.vim
"let g:AutoComplPop_CompleteOption = '.,w,b,k'
"let g:AutoComplPop_IgnoreCaseOption = 1
"autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
"autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
"autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
"autocmd FileType html let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
"autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
"autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'

" ポップアップの配色
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

" 括弧補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" -------------------
" Function定義
" -------------------
" GetStatusEx:ステータス表示用function
function! GetStatusEx()
    let str = ''
    let str = str . '' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ':' . str
    endif
    return str
endfunction


if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = '~/.dein.toml'
let s:lazy_toml_file = '~/.dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" refeコマンドのパス
let g:ref_refe_cmd = $HOME . '/.rbenv/shims/refe'

" f**kin python2のパス
let g:python_host_prog= system('(echo -n "/Users/taira/.pyenv/versions/2.7.14/bin/python")')

" python3のパス
let g:python3_host_prog= system('(echo -n "/Users/taira/.pyenv/versions/$(pyenv global)/bin/python")')

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" emmet-vim
" --------------------------------
let g:user_emmet_settings = {
      \  'lang' : 'ja'
      \}

" --------------------------------
" easymotion
" --------------------------------
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" --------------------------------
" NERDTree
" --------------------------------
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree

" --------------------------------
" deoplete
" --------------------------------
let g:deoplete#enable_at_startup = 1

" --------------------------------
" deoplete-clang
" --------------------------------
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/usr/local/Cellar/llvm/6.0.0/lib/clang'

" --------------------------------
" vim-textobj-ruby-block
" --------------------------------
runtime macros/matchit.vim

" --------------------------------
" 基本設定
" --------------------------------
" set lang to English
language en_US

" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" ignore case
set ignorecase

" dont highlight words
set nohlsearch

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" set <Space> as <Leader>
nnoremap <SPACE> <Nop>
map <SPACE> <leader>

" ハイライトを有効化する
syntax enable

" set color scheme
let g:hybrid_custom_term_colors = 1

" 行番号を表示する
set number

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

set tabstop=2 shiftwidth=2 softtabstop=2

"バックスペースを有効化"
set backspace=indent,eol,start

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on
autocmd BufRead,BufNewFile *.vue set filetype=html
autocmd BufRead,BufNewFile *.schema set filetype=ruby
autocmd BufRead,BufNewFile *.ts set filetype=javascript

" --------------------------------
" key map 
" --------------------------------
inoremap <C-j> <Down>
inoremap <C-k> <C-o>k
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <Delete>
inoremap <C-d> <BS>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o><C-0>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
nnoremap <C-s> :%s/
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ; :
nnoremap : ;
nnoremap <S-h> <C-0>
nnoremap <S-l> $
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

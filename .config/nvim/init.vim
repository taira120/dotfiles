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
let g:python_host_prog= system('echo -n ' . "$(pyenv root)/versions/2.7.0/bin/python2.7")

" python3のパス
let g:python3_host_prog= system('echo -n ' . "$(pyenv root)/versions/3.7.4/bin/python3.7")

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
autocmd VimEnter * NERDTree

" --------------------------------
" deoplete
" --------------------------------
let &runtimepath = expand("~/.cache/dein/repos/github.com/Shougo/deoplete.nvim") .",". &runtimepath
let g:deoplete#enable_at_startup = 1

" --------------------------------
" deoplete-clang
" --------------------------------
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/usr/local/Cellar/llvm/6.0.0/lib/clang'

" --------------------------------
" deoplete with go
" --------------------------------
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" --------------------------------
" vim-textobj-ruby-block
" --------------------------------
runtime macros/matchit.vim

" --------------------------------
" vimtex
" --------------------------------
let g:tex_flavor = "latex"

let g:vimtex_latexmk_enabled = 1
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \}

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction

let g:vimtex_toc_split_pos = "topleft"
let g:vimtex_toc_width = 10

" let g:vimtex_build_dir = './compiled_tex/'

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
set hlsearch

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

" バックスペースを有効化
set backspace=indent,eol,start

" open quickfix-window automatically
autocmd QuickFixCmdPost *grep* cwindow


" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on
autocmd BufRead,BufNewFile *.vue set filetype=html
autocmd BufRead,BufNewFile *.schema set filetype=ruby
autocmd BufRead,BufNewFile *.ruby set filetype=ruby
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile *.ts set filetype=javascript
autocmd BufRead,BufNewFile *.dart set filetype=dart
autocmd BufRead,BufNewFile *.c set filetype=c
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd BufRead,BufNewFile *.jl set filetype=julia

" --------------------------------
" key map
" --------------------------------
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <Delete>
inoremap <C-d> <BS>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o><C-0>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
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
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-S-w> :tabclose<CR>
nnoremap ; :
nnoremap : ;
nnoremap <S-h> <C-0>
nnoremap <S-l> $
nnoremap <C-CR> o<ESC>
nnoremap == gg=G
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :qa<CR>

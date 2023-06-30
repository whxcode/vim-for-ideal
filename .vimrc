set number
set shell=zsh
set showmatch
set cursorline
let mapleader = " "  " map leader键设置 

"dog

au! FileType bito set syntax=java

let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
let g:xcodedark_green_comments = 0

let g:signify_sign_show_count = 0 " Don’t show the number of deleted lines.


augroup vim-colors-xcode
    autocmd!
augroup END

autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic



" Update Git signs every time the text is changed
autocmd User SignifySetup
            \ execute 'autocmd! signify' |
            \ autocmd signify TextChanged,TextChangedI * call sy#start()
 

augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen guifg=red
augroup END

tnoremap <Esc> <C-\><C-n>

hi! MatchParen ctermbg=blue guibg=red



command! -nargs=1 Nc :n %:h/<args>



augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END


autocmd FileType scss setl iskeyword+=@-@
autocmd FileType scss setl iskeyword+=@
autocmd FileType scss setl iskeyword+=$
autocmd FileType scss setl iskeyword+=-

autocmd FileType css setl iskeyword+=@
autocmd FileType css setl iskeyword+=$
autocmd FileType css setl iskeyword+=-

autocmd TermOpen * setlocal nonumber norelativenumber

set diffopt=internal,filler,closeoff,vertical
let g:go_debug=['shell-commands'] 
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

map   <silent>   <Leader>]   <cmd>HopLine<CR>
map   <silent>   <Leader>[  <cmd>HopChar2<CR>

nmap <Leader>ss :HopChar2<CR>

nmap ,g :ChatGPT<CR>
nmap ,gi :ChatGPTEditWithInstructions<CR>

nmap <Leader>b :Buffers<CR>
nmap <Leader>t :NvimTreeToggle<CR>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


let g:far#enable_undo=1

nnoremap <C-k> <Up>ddp<Up>
nnoremap <C-j> ddp

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

function! Sw() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

"使用 coc.nvim 插件。 
" 回车补齐。
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <C-w>v <Plug>(coc-definition) 
nmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
" Prettier file
nmap <Leader>l :Prettier<CR>

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

"search fzf
nmap <Leader>f :FzfLua<CR>
nmap <Leader><Leader> <cmd>lua require('fzf-lua').files()<CR>
nmap <Leader>b <cmd>lua require('fzf-lua').buffers()<CR>
nmap <Leader>fg <cmd>lua require('fzf-lua').git_status()<CR>
nmap <Leader>fb <cmd>lua require('fzf-lua').git_branches()<CR>
nmap <Leader>fs <cmd>lua require('fzf-lua').git_stash()<CR>
nmap <Leader>fm :Marks<CR>
nmap <Leader>r <cmd>lua require('fzf-lua').grep()<CR><CR>
nmap <Leader>rr <cmd>lua require('fzf-lua').grep_cword()<CR><CR>
nmap <Leader>rc <cmd>lua require('fzf-lua').lgrep_curbuf()<CR><CR>
nmap <Leader>h <cmd>lua require('fzf-lua').oldfiles()<CR>
nmap <Leader>fh <cmd>lua require('fzf-lua').search_history()<CR>
nmap <Leader>fc <cmd>lua require('fzf-lua').command_history()<CR>
nmap <Leader>fj <cmd>lua require('fzf-lua').jumps()<CR>

nmap <Leader>to <cmd>lua require('fzf-lua').grep()<CR>// TODO<CR>
nmap <Leader>fi <cmd>lua require('fzf-lua').grep()<CR>// FIXME<CR>
nmap <Leader>ha <cmd>lua require('fzf-lua').grep()<CR>// HACK<CR>

nmap <Leader>gc :Commits<CR>
nmap <Leader>gb :BCommits<CR>
nmap <Leader>' :Telescope registers<CR>
nmap <Leader>ww :Windows<CR>
let g:fzf_action = { 'alt-e': 'edit' }

set incsearch
cnoremap <c-n> <CR>n/<c-p>

nmap <Leader>bs :w<CR>
nmap <Leader>bS :wa<CR>

map <Leader>s <Plug>(easymotion-prefix)

nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

" 显示当前行的提交记录
" call Git 
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR> 
noremap <Leader>pu :G push<CR>
noremap <Leader>fu :G pull<CR>
noremap <Leader>gg :G<CR>
noremap <Leader>gczw :G stash save<CR>
noremap <Leader>gczp :G stash pop<CR>

" window key
noremap <Leader>wv <C-w>v
noremap <Leader>ws <C-w>s
noremap <Leader>wl <C-w>l
noremap <Leader>wh <C-w>h
noremap <Leader>wj <C-w>j
noremap <Leader>wk <C-w>k
noremap <Leader>wx <C-w>x
noremap <Leader>wr <C-w>r
noremap <Leader>wq <C-w>q
nmap <silent> qq :q!<CR>


nnoremap <leader>n <cmd>lua require('memento').toggle()<CR>

" cancel light
noremap <Leader>nh :set nohlsearch<CR>
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>


"check spell
nmap <leader>m <Plug>(coc-codeaction-selected)<CR>

"save
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.tsx exec ":call SetTitle()"
"autocmd BufWriteCmd * exec ":Prettier"

let g:im_select_default = 'com.apple.keylayout.US'

" share system clipboard
set clipboard=unnamedplus

" Undo 持久化
if has('persistent_undo')
" define a path to store persistent_undo files.
let target_path = expand('~/.vim/undofiles/')

  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
    call system('mkdir -p ' . target_path)
  endif

  " point Vim to the defined undo directory.
  let &undodir = target_path

  " finally, enable undo persistence.
  set undofile
endif

" 将 swap 文件保存到指定目录，而不是工作目录中
"set directory=$HOME/.vim/swapfiles/
"set backupdir=$HOME/.vim/backupfiles/
set nobackup
set noswapfile
" 自动加载修改过的 file
set autoread
set mouse = " 关闭鼠标。
set exrc

" 禁止光标闪烁
set guicursor=a:blinkon0 "禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


nmap <Leader>p :call CompileRunGcc()<CR>
map <F6>call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'ts'
        exec "!ts-node *.ts -o %<"
        exec "!time ./%<"
    elseif &filetype == 'typescript'
        exec "!ts-node *.ts -o %<"
        exec "!time ./%<"
    elseif &filetype == 'c'
        exec "!gcc *.c -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++  % -o %<.out"
        exec "!time ./%<.out && rm -rf %<.out"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'pl'
        :!time perl %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Mofiqul/dracula.nvim'
"Plugin 'scrooloose/nerdtree'
"
"
Plugin 'nvim-tree/nvim-tree.lua'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'eslint/eslint'
Plugin 'rking/ag.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'Chiel92/vim-autoformat'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'coffeescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'markdown',
    \ 'python',
    \ 'html' ] }
Plugin 'wincent/ferret'
Plugin 'rlue/vim-barbaric'
Plugin 'sbdchd/neoformat'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'numkil/ag.nvim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plugin 'ferrine/md-img-paste.vim' 
Plugin 'kovisoft/slimv'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plugin 'easymotion/vim-easymotion'
Plugin 'phaazon/hop.nvim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'voldikss/vim-floaterm'
Plugin 'dinhhuy258/git.nvim'
Plugin 'neoclide/jsonc.vim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'windwp/nvim-spectre'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'gennaro-tedesco/nvim-peekup'
Plugin 'chentoast/marks.nvim'
Plugin 'nvim-telescope/telescope.nvim',
Plugin 'nvim-telescope/telescope-file-browser.nvim'
Plugin 's1n7ax/nvim-terminal'
Plugin 'brglng/vim-im-select'
Plugin 'akinsho/git-conflict.nvim'
Plugin 'https://github.com/adelarsq/image_preview.nvim'
Plugin 'numToStr/Comment.nvim'
Plugin 'ibhagwan/fzf-lua', {'branch': 'main'}
Plugin 'gennaro-tedesco/nvim-possession'
Plugin 'tpope/vim-abolish'
Plugin 'antoinemadec/coc-fzf'

"Plugin 'anuvyklack/pretty-fold.nvim'
Plugin 'kevinhwang91/promise-async'
Plugin 'kevinhwang91/nvim-ufo'
Plugin  'luukvbaal/statuscol.nvim',
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'andymass/vim-matchup'
Plugin 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'gelguy/wilder.nvim'
Plugin 'mizlan/iswap.nvim'
Plugin 'kylechui/nvim-surround'
Plugin 'rest-nvim/rest.nvim'
Plugin 'arzg/vim-colors-xcode'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'gen740/SmoothCursor.nvim'
Plugin 'cpea2506/one_monokai.nvim'
"Plugin 'nvim-treesitter/nvim-treesitter-context'
Plugin 'neovim/nvim-lspconfig'
Plugin  'SmiteshP/nvim-navic'
Plugin 'MunifTanjim/nui.nvim'
Plugin 'numToStr/Comment.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'SmiteshP/nvim-navbuddy'
Plugin 'folke/tokyonight.nvim'
Plugin 'rebelot/kanagawa.nvim'
Plugin 'catppuccin/nvim', { 'as': 'catppuccin' }
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Civitasv/cmake-tools.nvim'
Plugin 'zhenyangze/vim-bitoai'
Plugin 'voldikss/vim-translator'
Plugin  'jackMort/ChatGPT.nvim'
Plugin  'debugloop/telescope-undo.nvim'


call vundle#end()  " required

"filetype plugin indent on
set nu
set ruler
syntax enable
set guifont=Monaco:h12


set expandtab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set autoread


set statusline+=%F\ %l\:%c

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

nmap <F6> :exec '!'.getline('.')

set smartcase
set hlsearch
set smartcase
set incsearch

set ff=unix

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> 8 :call VisualSelection('f')<CR>
vnoremap <silent> 3 :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p



" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2



" Set utf8 as standard encoding and en_US as the standard language
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf8
set scrolloff=5
" 解决编码问题



"filetype plugin on
filetype indent on
set secure

"let g:formator = 'prettier --write ./' 
function! s:formator()
  let l:cmd = 'prettier --write ./' . @% 
  let l:results = system(l:cmd)
  execute 'e ' . @%
endfunction

command! -nargs=0 -complete=command Formator call <SID>formator()

function! s:check()
  "let l:name = '__SQL_Results__'
  "execute 'split ' . l:name
  let l:cmd= './node_modules/.bin/eslint  -c ./.eslintrc.js --fix ./' . @%  
  let l:results = systemlist(l:cmd)
  copen
  set modifiable
  call append('$', l:results)
  
endfunction

command! -nargs=0 -complete=command Check call <SID>check()
"autocmd BufWritePost * call <SID>check()

" The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
let g:barbaric_ime = 'macos'

" The input method for Normal mode (as defined by `xkbswitch -g`, `ibus engine`, or `xkb-switch -p`)
let g:barbaric_default = 0

" The scope where alternate input methods persist (buffer, window, tab, global)
let g:barbaric_scope = 'buffer'

" Forget alternate input method after n seconds in Normal mode (disabled by default)
" Useful if you only need IM persistence for short bursts of active work.
let g:barbaric_timeout = -1

" The fcitx-remote binary (to distinguish between fcitx and fcitx5)
let g:barbaric_fcitx_cmd = 'fcitx5-remote'

" The xkb-switch library path (for Linux xkb-switch users ONLY)
let g:barbaric_libxkbswitch = $HOME . '/.local/lib/libxkbswitch.so'


"autocmd BufWritePre *.ts Neoformat

command! JF :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
  \ | :set ft=javascript
  \ | :1

map <F2> :NERDTreeToggle<CR>


Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口 

let  g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


set signcolumn=yes

nmap ]h <Plugin>(GitGutterNextHunk) "same as default
nmap [h <Plugin>(GitGutterPrevHunk) "same as default

nmap ghs <Plugin>(GitGutterStageHunk)
nmap ghu <Plugin>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'


let g:airline_powerline_fonts = 1

let g:coc_global_extensions = ['coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-python','coc-flutter',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight']

nnoremap <silent>M :call CocAction('doHover')<CR>


function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(50, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" auto savefile
set autowriteall


" 新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.tsx,*.pl exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func! SetTitle()
    "如果文件类型为.sh文件
    "
    if &filetype == 'pl'
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
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "> File Name: ".expand("%"))
        call append(line(".")+1, "> Author: ")
        call append(line(".")+2, "> Mail: ")
        call append(line(".")+3, "> Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
        call append(line(".")+9, "int main(){")
        call append(line(".")+10, "return 0;")
        call append(line(".")+11, "}")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main() {")
        call append(line(".")+9, "printf(\"hello word\");")
        call append(line(".")+10, "return 0;")
        call append(line(".")+11, "}")
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
    if &filetype == 'tsx'
        call append(line(".")+6,"import * as React from 'react'")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G
"""""""""""""""""""""""""""""""""""""""""
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>e  :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent><nowait> <space>a  :<C-u>CocFzfList actions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocFzfList commands<CR>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

nnoremap   <silent>   ,o    :FloatermNew --cwd=<buffer><CR>

"let g:floaterm_keymap_new    = ',o'
let g:floaterm_keymap_prev   = ',p'
let g:floaterm_keymap_next   = ',n'
let g:floaterm_keymap_toggle = ',t'
let g:floaterm_keymap_kill = ',q'



lua require('nvim-peekup.config').on_keystroke["paste_reg"] = '+'
lua require('nvim-peekup.config').on_keystroke["delay"] = ''
lua require('nvim-peekup.config').on_keystroke["autoclose"] = true 

let g:peekup_paste_before = '<leader>q'
let g:peekup_paste_after = '<leader>pp'

let g:peekup_empty_registers = 'p][]'


lua <<EOF
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}

EOF


lua << EOF
-- following option will hide the buffer when it is closed instead of deleting
-- the buffer. This is important to reuse the last terminal buffer
-- IF the option is not set, plugin will open a new terminal every single time
vim.o.hidden = true

require('nvim-terminal').setup({
    window = {
        -- Do `:h :botright` for more information
        -- NOTE: width or height may not be applied in some "pos"
        position = 'botright',

        -- Do `:h split` for more information
        split = 'vsp',

        -- Width of the terminal
        width = 50,

        -- Height of the terminal
        height = 100,
    },

    -- keymap to disable all the default keymaps
    disable_default_keymaps = false,

    -- keymap to toggle open and close terminal window
    toggle_keymap = '<leader>;',

    -- increase the window height by when you hit the keymap
    window_height_change_amount = 2,

    -- increase the window width by when you hit the keymap
    window_width_change_amount = 2,

    -- keymap to increase the window width
    increase_width_keymap = '<leader><leader>+',

    -- keymap to decrease the window width
    decrease_width_keymap = '<leader><leader>-',

    -- keymap to increase the window height
    increase_height_keymap = '<leader>+',

    -- keymap to decrease the window height
    decrease_height_keymap = '<leader>-',

    terminals = {
        -- keymaps to open nth terminal
        {keymap = '<leader>1'},
        {keymap = '<leader>2'},
        {keymap = '<leader>3'},
        {keymap = '<leader>4'},
        {keymap = '<leader>5'},
    },
})
EOF


lua << EOF
  require('git-conflict').setup()
EOF


set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor
set guicursor+=n-v-c:block-Cursor
set guicursor+=i:block-Cursor

map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>r

"
"
"set background=dark
"set termguicolors
"colorscheme xcodedarkhc
"'colorscheme xcodedarkhc

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

lua <<EOF
require("image_preview").setup({})
EOF

lua << EOF
require('Comment').setup()
EOF


lua require("nvim-possession").setup({})




nmap <Leader>sl <cmd>lua require("nvim-possession").list()<CR>
nmap <Leader>sn <cmd>lua require("nvim-possession").new()<CR>
nmap <Leader>su <cmd>lua require("nvim-possession").update()<CR>


vnoremap   <silent>   ,a    :yank a<CR>
noremap   <silent>   ,aa    :put a<CR>

vnoremap   <silent>   ,s    :yank s<CR>
noremap   <silent>   ,ss    :put s<CR>

vnoremap   <silent>   ,q    :yank q<CR>
noremap   <silent>   ,qq    :put q<CR>

vnoremap   <silent>   ,p    :yank p<CR>
noremap   <silent>   ,pp    :put p<CR>



let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []


lua << EOF
 local builtin = require("statuscol.builtin")
 require("statuscol").setup(
 {
     relculright = true,
     segments = {
       {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
       {text = {"%s"}, click = "v:lua.ScSa"},
       {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
     }
     }
 )

EOF

lua << EOF

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'

local handler = function(virtText, lnum, endLnum, width, truncate)
local newVirtText = {}
local totalLines = vim.api.nvim_buf_line_count(0)
local foldedLines = endLnum - lnum
local suffix = ("  %d"):format(foldedLines )
local sufWidth = vim.fn.strdisplaywidth(suffix)
local targetWidth = width - sufWidth
local curWidth = 0
for _, chunk in ipairs(virtText) do
  local chunkText = chunk[1]
  local chunkWidth = vim.fn.strdisplaywidth(chunkText)
  if targetWidth > curWidth + chunkWidth then
    table.insert(newVirtText, chunk)
  else
    chunkText = truncate(chunkText, targetWidth - curWidth)
    local hlGroup = chunk[2]
    table.insert(newVirtText, { chunkText, hlGroup })
    chunkWidth = vim.fn.strdisplaywidth(chunkText)
    -- str width returned from truncate() may less than 2nd argument, need padding
    if curWidth + chunkWidth < targetWidth then
      suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
      end
      curWidth = curWidth + chunkWidth
      end
      local rAlignAppndx =
      math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
      suffix = (" "):rep(rAlignAppndx) .. suffix
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
      end


-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'B', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)


require('ufo').setup({
  fold_virt_text_handler = handler,
 open_fold_hl_timeout = 400,
    close_fold_kinds = { "imports", "comment" },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        -- winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
    provider_selector = function(bufnr, filetype, buftype)
      return {"treesitter", "indent"}
    end
})

EOF


lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
 matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    -- [options]
  },
 rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  incremental_selection = { enable = true, keymaps = { init_selection = '<CR>', node_incremental = '<CR>', node_decremental = '<BS>', scope_incremental = '<TAB>' } },
  indent = { enable = true }
}

EOF



lua << EOF
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

require("lspconfig").tsserver.setup({
    -- Other settings here
    -- on_attach = function(client, bufnr) require("nvim-navic").attach(client, bufnr) end
  on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
        navic.attach(client, bufnr)
    end,


  window = {
        border = "single",  -- "rounded", "double", "solid", "none"
                            -- or an array with eight chars building up the border in a clockwise fashion
                            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
        position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
            left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
            },
            mid = {
                size = "40%",
                border = nil,
            },
            right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf",  -- Right section can show previews too.
                                   -- Options: "leaf", "always" or "never"
            }
        },
    },
    node_markers = {
        enabled = true,
        icons = {
            leaf = "  ",
            leaf_selected = " → ",
            branch = " ",
        },
    },
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = " ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    use_default_mappings = true,            -- If set to false, only mappings set
                                            -- by user are set. Else default
                                            -- mappings are used for keys
                                            -- that are not set by user
    mappings = {
        ["<esc>"] = actions.close(),        -- Close and cursor to original location
        ["q"] = actions.close(),

        ["j"] = actions.next_sibling(),     -- down
        ["k"] = actions.previous_sibling(), -- up

        ["h"] = actions.parent(),           -- Move to left panel
        ["l"] = actions.children(),         -- Move to right panel
        ["0"] = actions.root(),             -- Move to first panel

        ["v"] = actions.visual_name(),      -- Visual selection of name
        ["V"] = actions.visual_scope(),     -- Visual selection of scope

        ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name(),      -- Insert at start of name
        ["I"] = actions.insert_scope(),     -- Insert at start of scope

        ["a"] = actions.append_name(),      -- Insert at end of name
        ["A"] = actions.append_scope(),     -- Insert at end of scope

        ["r"] = actions.rename(),           -- Rename currently focused symbol

        ["d"] = actions.delete(),           -- Delete scope

        ["f"] = actions.fold_create(),      -- Create fold of current scope
        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

        ["c"] = actions.comment(),          -- Comment out current scope

        ["<enter>"] = actions.select(),     -- Goto selected symbol
        ["o"] = actions.select(),

        ["J"] = actions.move_down(),        -- Move focused node down
        ["K"] = actions.move_up(),          -- Move focused node up

        ["t"] = actions.telescope({         -- Fuzzy finder at current level.
            layout_config = {               -- All options that can be
                height = 0.60,              -- passed to telescope.nvim's
                width = 0.60,               -- default can be passed here.
                prompt_position = "top",
                preview_width = 0.50
            },
            layout_strategy = "horizontal"
        }),

        ["g?"] = actions.help(),            -- Open mappings help window
    },
    lsp = {
        auto_attach = false,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    }

})

navic.setup {
  icons = {
        File          = "",
        Module        = "",
        Namespace     = "",
        Package       = "",
        Class         = "",
        Method        = "",
        Property      = "",
        Field         = "",
        Constructor   = "",
        Enum          = "",
        Interface     = "",
        Function      = "",
        Variable      = "",
        Constant      = "",
        String        = "",
        Number        = "",
        Boolean       = "",
        Array         = "",
        Object        = "",
        Key           = "",
        Null          = "",
        EnumMember    = "",
        Struct        = "",
        Event         = "",
        Operator      = "",
        TypeParameter = "",
  },
}




require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
 lualine_a = {
   {
      'filename',
      file_status = true,      -- Displays file status (readonly status, modified status)
      newfile_status = false,  -- Display new file status (new file means no write after created)
      path =1 ,                -- 0: Just the filename
      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
    }

  },
  lualine_b = {
    {
      'diagnostics',

      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { 'nvim_diagnostic', 'coc' },

      -- Displays diagnostics for the defined severity types
      sections = { 'error', 'warn', 'info', 'hint' },

      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
      },
      symbols = {error = '❌', warn = '⚠️', info = '❕', hint = '🏁'},
      colored = true,           -- Displays diagnostics status in color if set to true.
      update_in_insert = false, -- Update diagnostics in insert mode.
      always_visible = false,   -- Show diagnostics even if there are none.
    }
    },
   lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        },
    -- These will be filled later
    lualine_x={},

  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  }
}


-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end


ins_right {
  'branch',
  color = { fg = colors.violet, gui = 'bold' },
}

-- Now don't forget to initialize lualine
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}" 


lualine.setup(config)


EOF




lua << EOF
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})



wilder.set_option('pipeline', {
  wilder.branch(
    wilder.python_file_finder_pipeline({
      -- to use ripgrep : {'rg', '--files'}
      -- to use fd      : {'fd', '-tf'}
      --file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'}, 
      file_command = {'rg','--files'}, 
      -- to use fd      : {'fd', '-td'}
      dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      -- found at https://github.com/nixprime/cpsm
      filters = {'fuzzy_filter', 'difflib_sorter'},
    }),
    wilder.cmdline_pipeline(),
    wilder.python_search_pipeline()
  ),

})

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

wilder.set_option('renderer', wilder.popupmenu_renderer({
  pumblend = 0,
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
  highlights = {
    gradient = gradient, -- must be set
    -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
  },
  highlighter = wilder.highlighter_with_gradient({
    wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
  }),
}))



EOF



lua << EOF
require'hop'.setup()
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})

--vim.keymap.set('', 't', function()
 -- hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, {remap=true})
--vim.keymap.set('', 't', function()
-- hop.hint_line({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--end, {remap=true})
--vim.keymap.set('', 'T', function()
 -- hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--end, {remap=true})

EOF

lua << EOF
require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'qwertyuiop',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'disable',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  hl_snipe = 'ErrorMsg',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  hl_selection = 'WarningMsg',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'LineNr',

  -- Post-operation flashing highlight style,
  -- either 'simultaneous' or 'sequential', or false to disable
  -- default 'sequential'
  flash_style = false,

  -- Highlight group for flashing highlight afterward
  -- default 'IncSearch'
  hl_flash = 'ModeMsg',

  -- Move cursor to the other element in ISwap*With commands
  -- default false
  move_cursor = true,

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true,

  -- Other default options you probably should not change:
  debug = nil,
  hl_grey_priority = '1000',
}
EOF

lua << EOF
 require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
EOF

lua << EOF
  require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
EOF


lua << EOF
local api = require('nvim-tree.api')

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


EOF

lua << EOF
require('smoothcursor').setup({
  cursor = "⭕️",
})


local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = false, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
})

theme = 'dracula-soft'
EOF

lua << EOF
require("cmake-tools").setup {
  cmake_command = "cmake", -- this is used to specify cmake command path
  cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
  cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
  cmake_build_directory = "", -- this is used to specify generate directory for cmake
  cmake_build_directory_prefix = "cmake_build_", -- when cmake_build_directory is set to "", this option will be activated
  cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
  cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
  cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
  cmake_variants_message = {
    short = { show = true }, -- whether to show short message
    long = { show = true, max_length = 40 } -- whether to show long message
  },
  cmake_dap_configuration = { -- debug settings for cmake
    name = "cpp",
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
  cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
  cmake_quickfix_opts = { -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
    show = "always", -- "always", "only_on_error"
    position = "belowright", -- "bottom", "top"
    size = 10,
  },
  cmake_terminal_opts = { -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
    name = "Main Terminal",
    prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
    split_direction = "horizontal", -- "horizontal", "vertical"
    split_size = 11,

    -- Window handling
    single_terminal_per_instance = true, -- Single viewport, multiple windows
    single_terminal_per_tab = true, -- Single viewport per tab
    keep_terminal_static_location = true, -- Static location of the viewport if avialable

    -- Running Tasks
    start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
    start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
    focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
    focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
  }
}

EOF

lua << EOF
local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
    --api_key_cmd = "op read op://private/OpenAI/credential --no-newline"
  api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg",
  popup_input = {
      prompt = "  ",
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top_align = "center",
          top = " Prompt ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
      submit = "<CR>",
      submit_n = "<CR>",
    },


})

 require("telescope").setup({
extensions = {
    undo = {
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = false,
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      time_format = "",
      mappings = {
        i = {
          -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
          -- you want to replicate these defaults and use the following actions. This means
          -- installing as a dependency of telescope in it's `requirements` and loading this
          -- extension from there instead of having the separate plugin definition as outlined
          -- above.
          ["y"] = require("telescope-undo.actions").yank_additions,
          ["d"] = require("telescope-undo.actions").yank_deletions,
          ["r"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
    })

  require("telescope").load_extension("undo")

EOF

colorscheme tokyonight

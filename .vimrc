set number
set shell=zsh
let mapleader = " "  " map leader键设置 
let g:mapleader = " " 
set cursorline
set showmatch


tnoremap <Esc> <C-\><C-n>

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

nmap <Leader>ss <Plug>(easymotion-s2)

nmap <Leader>b :Buffers<CR>



let g:far#enable_undo=1

nnoremap <C-k> <Up>ddp<Up>
nnoremap <C-j> ddp

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
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
        exec "!g++ *.c -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
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
Plugin 'scrooloose/nerdtree'
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'easymotion/vim-easymotion'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'voldikss/vim-floaterm'
Plugin 'dinhhuy258/git.nvim'
Plugin 'neoclide/jsonc.vim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'windwp/nvim-spectre'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
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



" All of your Plugins must be added before the following line
call vundle#end()            " required
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


autocmd BufWritePre *.ts Neoformat

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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


call wilder#setup({'modes': [':', '/', '?']})

" 'file_command' : for ripgrep : ['rg', '--files']
"                : for fd      : ['fd', '-tf']
" 'dir_command'  : for fd      : ['fd', '-td']
" 'filters'      : use ['cpsm_filter'] for performance, requires cpsm vim plugin
"                  found at https://github.com/nixprime/cpsm
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['rg', '--files'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline(),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])

" wilder#popupmenu_border_theme() is optional.
" 'min_height' : sets the minimum height of the popupmenu
"              : can also be a number
" 'max_height' : set to the same as 'min_height' to set the popupmenu to a fixed height
" 'reverse'    : if 1, shows the candidates from bottom to top
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'min_width': '30%',
      \ 'max_width': '40%',
      \ 'min_height': '30%',
      \ 'max_height': '40%',
      \ 'reverse': 10,
      \ 'pumblend': 50,
      \ })))


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

set background=dark
colorscheme dracula

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
lua require("statuscol").setup({
  foldfunc = "builtin",
  setopt = true,
})

EOF

lua << EOF

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
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
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
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
  fold_virt_text_handler = handler
})

EOF


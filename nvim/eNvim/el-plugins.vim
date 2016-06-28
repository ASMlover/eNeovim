" Copyright (c) 2016 ASMlover. All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
"
"  * Redistributions of source code must retain the above copyright
"    notice, this list ofconditions and the following disclaimer.
"
"  * Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in
"    the documentation and/or other materialsprovided with the
"    distribution.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
" FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
" COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
" INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
" BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
" ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
" POSSIBILITY OF SUCH DAMAGE.

" Plugs here are part of the core setup.
" DO NOT add plugs to this list, as they might get removed when you upgrade.
" Please add any extra plugs you want in ./local/plugs.vim.
call plug#begin('~/.config/nvim/plugged')
  " molokai color scheme for nvim
  Plug 'ASMlover/molokai'
  " solarized color scheme for nvim
  Plug 'ASMlover/vim-colors-solarized'
  " help folks to align text, etc
  Plug 'vim-scripts/Align', {'on': 'Align'}
  " use ag(the_silver_searcher, better than ack, which is better than grep)
  Plug 'rking/ag.vim', {'on': 'Ag'}
  " a tree explorer plugin for vim
  Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
  " nerdtree and tabs together in vim
  Plug 'jistr/vim-nerdtree-tabs', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
  " a plugin that displays tags in a window
  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
  " display the indention levels with thin vertical lines
  Plug 'Yggdroot/indentLine', {'on': 'LeadingSpaceToggle'}
  " git commands in vim
  Plug 'tpope/vim-fugitive'
  " rename the current file in the vim buffer and retain relative path
  Plug 'danro/rename.vim', {'on': 'Rename'}
  " smart status airline for vim
  Plug 'ASMlover/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  if g:plugin_sccompile_enabled
    " a plugin marking it more convenient to compile or run a single source file
    Plug 'xuhdev/SingleCompile', {'on': ['SCCompileRun', 'SCCompile']}
  endif
  if g:plugin_ctrlp_enabled
    " full path fuzzy file, buffer, meu, tag... finder for vim
    Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPClearCache']}
  endif
  if g:plugin_leaderf_enabled
    " quickly locate files, buffers, mrus in large project
    Plug 'Yggdroot/LeaderF', {'on': ['Leaderf', 'LeaderfBuffer', 'LeaderfBufferAll', 'LeaderfMru']}
  endif
  if g:plugin_syntastic_enabled
    " syntax checking hacks for vim
    Plug 'scrooloose/syntastic', {'for': ['c', 'cpp', 'python']}
  endif
  if g:plugin_ycm_enabled
    " a code-completion engine for vim
    Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'python']}
    autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
  endif

  " install local plugins configure if available
  Import local/el-plugins.vim
call plug#end()

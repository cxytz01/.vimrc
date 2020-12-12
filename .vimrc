"syntax on
set expandtab "expand tab to space
set tabstop=4
set shiftwidth=4 "<< >>
set autoindent smartindent shiftround
set number
set nowrap "notepad++ !wrap
set incsearch "do incremental searching, search as you type
set hlsearch " highlight searches
set title " change the terminal's title "



" ---------------------set ctags---------------------
" sudo apt-get install ctags
" ctags -R -f .tags ./; ctags file: move tags .tags
" ctrl + ] | ctrl + w + ]
set tags=./.tags;,.tags



" ---------------------plugin install---------------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged') " Plugins will be downloaded under the specified directory.
    " Declare the list of plugins.
    Plug 'mhinz/vim-startify' " https://github.com/mhinz/vim-startify.git
    Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
    Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags' " https://github.com/ludovicchabant/vim-gutentags
call plug#end() " List ends here. Plugins become visible to Vim after this call.

" ---------------------Plugin speciality setting---------------------
" let Tlist_Auto_Open = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window =1

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] " gutentags搜索工程目录的标志,碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_ctags_tagfile = '.tags' " 所生成的数据文件的名称
let s:vim_tags = expand('~/.cache/tags') " 将自动生成的tags文件全部放入~/.cache/tags目录中,避免污染工程目录
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags) " 检测~/.cache/tags不存在就新建
   silent! call mkdir(s:vim_tags, 'p')
endif

" ---------------------key binding---------------------
map <C-n> :NERDTreeToggle<CR> " toggle nerdtree with ctrl^n
map <C-m> :TagbarToggle<CR>







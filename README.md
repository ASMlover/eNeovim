# **eNeovim**
***
**Configure files for [neovim](https://github.com/neovim/neovim), built for Linux and macOS.**

## **Usage**
  * `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files, open a fresh NERD tree
  * `,j` same as `,d`, jump to the current file in NERD tree
  * `,a` starts project search with [ag.vim](https://github.com/rking/ag.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher)(like ack, but faster)
  * `,=` begins aligning lines on a string, usually used as `,l=` to align assignments
  * `,]` brings up [tagbar](https://github.com/majutsushi/tagbar), a sidebar buffer for displaying tags
  * `,f` brings up [LeaderF](https://github.com/Yggdroot/LeaderF), quickly locate files, buffers, mrus, ... in large project, launch LeaderF to search files
  * `,p` same as `,f`
  * `,b` same as `,f`, launch LeaderF to search buffers
  * `,i` brings up [indentLine](https://github.com/Yggdroot/indentLine), display the indention levels with thin vertical lines
  * `,,` display the whitespace(tab or space)
  * `,ev` editing your `init.vim($MYVIMRC)`
  * `,sv` reloading your `init.vim($MYVIMRC)`
  * `,gs` brings up [vim-fugitive](https://github.com/tpope/vim-fugitive), used as `:Gstatus`
  * `,gc` used as `:Gcommit`

## **Neovim for Linux**
### **Build Neovim**
Before upgrading to a new version, **ALWAYS** check the [Following HEAD](https://github.com/neovim/neovim/wiki/Following-HEAD) page.
  * General requirements
    - A recent version of Clang or GCC version 4.3 and above
    - CMake version 2.8.7 and above, build with TLS/SSL support
```bash
    $ sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```
  * Clone [neovim/neovim](https://github.com/neovim/neovim)
```bash
    $ git clone https://github.com/neovim/neovim.git
```
  * Build Neovim by running `make`
```bash
    $ cd neovim
    $ make
```
### **Install Neovim**
Once you've built Neovim, install it with the following commands:
```bash
    $ sudo make install
```
### **Uninstall Neovim**
To uninstall Neovim installed with `sudo make install`:
```bash
    $ sudo rm /usr/local/bin/nvim
    $ sudo rm -r /usr/local/share/nvim/
```

## **Install**

# Linux

- [Linux](#linux)
  - [Find (in files)](#find-in-files)
  - [NERDTree (vim plugin)](#nerdtree-vim-plugin)
  - [cscope](#cscope)
  - [cflow](#cflow)

## Find (in files)

```bash
grep -rnw 'path/to/somewhere' -e 'pattern'
```

## NERDTree (vim plugin)

```
:NERDTree path/to/somewhere
```

## cscope

```bash
cd ~/.vim/plugin
wget http://cscope.sourceforge.net/cscope_maps.vim
```

```bash
cd ~/os161/src/kern
find . -name "*.c" -o -name "*.S" -o -name "*.h" > cscope.files
cscope -q -R -b -i cscope.files
```

## cflow

```
cflow --include=s *.c
```


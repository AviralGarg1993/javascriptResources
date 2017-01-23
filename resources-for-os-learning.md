
##To find words in files

grep -rnw 'path/to/somewhere' -e 'pattern'



##NERDTree vim plugin

:NERDTree path/to/somewhere



##cscope
cd ~/.vim/plugin
wget http://cscope.sourceforge.net/cscope_maps.vim

Cd ~/os161/src/kern
find . -name "*.c" -o -name "*.S" -o -name "*.h" > cscope.files
cscope -q -R -b -i cscope.files


##cflow

cflow --include=s *.c


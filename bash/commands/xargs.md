# xargs

```bash
man xargs
```

### tutorial

```bash
mkdir xargstest
cd xargstest
mkdir dir1 dir2 dir3
echo "one" > dir1/file1A
echo "one\ntwo" > dir1/file1B
echo "one\ntwo\nthree" > dir2/file2A
echo "one\ntwo\nthree\nfour" > dir2/file2B
echo "one\ntwo\nthree\nfour\nfive" > dir3/file3A
echo "one\ntwo\nthree\nfour\nfive\nsix" > dir3/file3B

tree -if .
```

Подсчет количества строк во всех файлах
```console
$ find xargstest -name 'file??' | sort | xargs -t wc -l
wc -l xargstest/dir1/file1A xargstest/dir1/file1B xargstest/dir2/file2A xargstest/dir2/file2B xargstest/dir3/file3A xargstest/dir3/file3B
       1 xargstest/dir1/file1A
       2 xargstest/dir1/file1B
       3 xargstest/dir2/file2A
       4 xargstest/dir2/file2B
       5 xargstest/dir3/file3A
       6 xargstest/dir3/file3B
      21 total

```

Вывод первой строки каждого из заданных файлов
```console
$ find xargstest -name 'file?B' | sort | xargs -t head -n1
head -n1 xargstest/dir1/file1B xargstest/dir2/file2B xargstest/dir3/file3B
==> xargstest/dir1/file1B <==
one

==> xargstest/dir2/file2B <==
one

==> xargstest/dir3/file3B <==
one
```
Обработка каждого файла с помощью скрипта
```bash
cat << EOF > myscript.sh
#!/bin/bash

echo \$@
EOF

chmod 755 myscript.sh
```

```console
$ find xargstest -name 'file*' -print0 | xargs -t -0 ./myscript.sh
./myscript.sh xargstest/dir2/file2A xargstest/dir2/file2B xargstest/dir3/file3B xargstest/dir3/file3A xargstest/dir1/file1A xargstest/dir1/file1B
xargstest/dir2/file2A xargstest/dir2/file2B xargstest/dir3/file3B xargstest/dir3/file3A xargstest/dir1/file1A xargstest/dir1/file1B
```

```console
$ find xargstest -name 'file*' -print0 | xargs -t -L1 -0 ./myscript.sh
./myscript.sh xargstest/dir2/file2A
xargstest/dir2/file2A
./myscript.sh xargstest/dir2/file2B
xargstest/dir2/file2B
./myscript.sh xargstest/dir3/file3B
xargstest/dir3/file3B
./myscript.sh xargstest/dir3/file3A
xargstest/dir3/file3A
./myscript.sh xargstest/dir1/file1A
xargstest/dir1/file1A
./myscript.sh xargstest/dir1/file1B
xargstest/dir1/file1B
```


#### Ссылки
[Как использовать команду xargs в Linux](http://rus-linux.net/MyLDP/consol/xargs-kommand-in-linux.html)

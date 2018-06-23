# Bash-скрипты, часть 2: циклы

#### Перебор простых значений
```bash
#!/bin/bash

for var in first second third fourth fifth
do
    echo The $var item
done
```

#### Перебор сложных значений
```bash
#!/bin/bash

for var in first "the second" "the third" "I’ll do it"
do
    echo "This is: $var"
done
```

#### Инициализация цикла списком, полученным из результатов работы команды
Каждый элемент это слово
```bash
#!/bin/bash

file="myfile"
for var in $(cat $file)
do
    echo " $var"
done
```
чтобы обходить по строкам
```bash
IFS=$'\n'
```
#### Обход файлов, содержащихся в директории

```bash
#!/bin/bash

for file in /home/likegeeks/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    fi
done
```
> скрытые файлы и директории не обходит

#### Циклы for в стиле C
```bash
#!/bin/bash

for (( i=1; i <= 10; i++ )) do
    echo "number is $i"
done
```

#### Цикл while
```bash
#!/bin/bash

var1=5
while [ $var1 -gt 0 ]
do
    echo $var1
    var1=$[ $var1 - 1 ]
done
```

#### Вложенные циклы
```bash
#!/bin/bash

for (( a = 1; a <= 3; a++ )) do
    echo "Start $a:"
    for (( b = 1; b <= 3; b++ )) do
        echo " Inner loop: $b"
    done
done
```

#### Обработка содержимого файла
```bash
#!/bin/bash

IFS=$'\n'
for entry in $(cat /etc/passwd)
do
    echo "Values in $entry –"
    IFS=:
    for value in $entry
    do
        echo " $value"
    done
done
```

#### Управление циклами
* break
```bash
#!/bin/bash

for var1 in 1 2 3 4 5 6 7 8 9 10
do
    if [ $var1 -eq 5 ]
    then
        break
    fi
    echo "Number: $var1"
done
```

```bash
#!/bin/bash

var1=1
while [ $var1 -lt 10 ]
do
    if [ $var1 -eq 5 ]
    then
        break
    fi
    echo "Iteration: $var1"
    var1=$(( $var1 + 1 ))
done
```
* continue
```bash
#!/bin/bash

for (( var1 = 1; var1 < 15; var1++ ))
do
    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]
    then
        continue
    fi
    echo "Iteration number: $var1"
done
```

#### Обработка вывода, выполняемого в цикле
```bash
#!/bin/bash

for (( a = 1; a < 10; a++ ))
do
    echo "Number is $a"
done > myfile.txt
echo "finished."
```

#### Пример: поиск исполняемых файлов
```bash
#!/bin/bash

IFS=:
for folder in $PATH
do
    echo "$folder:"
    for file in $folder/*
    do
        if [ -x $file ]
            then
            echo " $file"
        fi
    done
done
```

# Bash-скрипты: начало

#### шебанг
```bash
#!/bin/bash
```


#### Переменные среды
```bash
#!/bin/bash

echo "Home for the current user is: $HOME"
echo "I have $1 in my pocket"
```
#### Пользовательские переменные
```bash
#!/bin/bash

grade=5
person="Adam"
echo "$person is a good boy, he is in grade $grade"
```
#### Подстановка команд
```bash
#!/bin/bash

mydir=`pwd`
mydir=$(pwd)
```
#### Математические операции
```bash
#!/bin/bash

var1=$(( 5 + 5 ))
var2=$[ 4 + 4 ] # deprecated
echo $var1
echo $var2
```
#### Управляющая конструкция if-then-else
```bash
#!/bin/bash

user=anotherUser
if grep $user /etc/passwd
then
    echo "The user $user Exists"
elif ls /home
then
    echo "The user doesn’t exist but anyway there is a directory under /home"
else
    echo "Kuku"
fi
```
#### Сравнение чисел
| Выражение | Описание |
| --- | --- |
| n1 -eq n2 | Возвращает истинное значение, если n1 равно n2. |
| n1 -ge n2 | Возвращает истинное значение, если n1больше или равно n2. |
| n1 -gt n2 | Возвращает истинное значение, если n1 больше n2. |
| n1 -le n2 | Возвращает истинное значение, если n1меньше или равно n2. |
| n1 -lt n2 | Возвращает истинное значение, если n1 меньше n2. |
| n1 -ne n2 | Возвращает истинное значение, если n1не равно n2. |

```bash
#!/bin/bash

val1=6
if [ $val1 -gt 5 ]
then
    echo "The test value $val1 is greater than 5"
else
    echo "The test value $val1 is not greater than 5"
fi
```
#### Сравнение строк
| Выражение | Описание |
| --- | --- |
| str1 = str2 | Проверяет строки на равенство, возвращает истину, если строки идентичны. |
| str1 != str2 | Возвращает истину, если строки не идентичны. |
| str1 < str2 | Возвращает истину, если str1 меньше, чем str2. |
| str1 > str2 | Возвращает истину, если str1 больше, чем str2. |
| -n str1 | Возвращает истину, если длина str1 больше нуля. |
| -z str1 | Возвращает истину, если длина str1 равна нулю. |
```bash
#!/bin/bash

user ="likegeeks"
if [$user = $USER]
then
    echo "The user $user  is the current logged in user"
fi
```

#### Проверки файлов
| Выражение | Описание |
| --- | --- |
| -d file | Проверяет, существует ли файл, и является ли он директорией. |
| -e file | Проверяет, существует ли файл. |
| -f file | Проверяет, существует ли файл, и является ли он файлом. |
| -r file | Проверяет, существует ли файл, и доступен ли он для чтения. |
| -s file | Проверяет, существует ли файл, и не является ли он пустым. |
| -w file | Проверяет, существует ли файл, и доступен ли он для записи. |
| -x file | Проверяет, существует ли файл, и является ли он исполняемым. |
| file1 -nt | file2 Проверяет, новее ли file1, чем file2. |
| file1 -ot | file2 Проверяет, старше ли file1, чем file2. |
| -O file | Проверяет, существует ли файл, и является ли его владельцем текущий пользователь. |
| -G file | Проверяет, существует ли файл, и соответствует ли его идентификатор группы идентификатору группы текущего пользователя. |

```bash
#!/bin/bash

mydir=/home/likegeeks
if [ -d $mydir ]
then
    echo "The $mydir directory exists"
    cd $ mydir
    ls
else
    echo "The $mydir directory does not exist"
fi
```

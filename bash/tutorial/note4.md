# Bash-скрипты, часть 4: ввод и вывод

#### Стандартные дескрипторы файлов
| Дескриптор | Описание |
| --- | --- |
|0, STDIN | стандартный поток ввода. |
|1, STDOUT | стандартный поток вывода. |
|2, STDERR | стандартный поток ошибок. |

#### STDIN

#### STDOUT

```bash
pwd >> myfile
```

#### STDERR

#### Перенаправление потока ошибок
```bash
ls –l myfile xfile anotherfile 2> errorcontent 1> correctcontent
```
> `&>` перенаправляет и STDIN, и STDERR
```bash
ls –l myfile xfile anotherfile &> content
```

#### Перенаправление вывода в скриптах
Временное перенаправление вывода
```bash
#!/bin/bash

echo "This is an error" >&2
echo "This is normal output"
```
Постоянное перенаправление вывода
```bash
#!/bin/bash

exec 1>outfile
echo "This is a test of redirecting all output"
echo "from a shell script to another file."
echo "without having to redirect every line"
```

```bash
#!/bin/bash

exec 2>myerror
echo "This is the start of the script"
echo "now redirecting all output to another location"
exec 1>myfile
echo "This should go to the myfile file"
echo "and this should go to the myerror file" >&2
```

#### Перенаправление ввода в скриптах
```bash
exec 0< myfile
```

```bash
#!/bin/bash

exec 0< testfile
count=1
while read line
do
    echo "Line #$count: $line"
    count=$(( $count + 1 ))
done
```

#### Создание собственного перенаправления вывода
```bash
#!/bin/bash

exec 3> myfile
echo "This should display on the screen"
echo "and this should be stored in the file" >&3
echo "And this should be back on the screen"
```

#### Создание дескрипторов файлов для ввода данных
```bash
#!/bin/bash

exec 6<&0
exec 0< myfile
count=1
while read line
do
    echo "Line #$count: $line"
    count=$(( $count + 1 ))
done

exec 0<&6
read -p "Are you done now? " answer
case $answer in
    y) echo "Goodbye";;
    n) echo "Sorry, this is the end.";;
esac
```
#### Закрытие дескрипторов файлов
```bash
#!/bin/bash

exec 3> myfile
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work" >&3
```
> line 6: 3: Bad file descriptor

#### Получение сведений об открытых дескрипторах
Для того, чтобы получить список всех открытых в Linux дескрипторов, можно воспользоваться командой lsof. У этой команды есть множество ключей, рассмотрим самые важные.

| Ключ | Описание |
| --- | --- |
| -p | Позволяет указать ID процесса. |
| -d | Позволяет указать номер дескриптора, о котором надо получить сведения. |
| -a | используется для выполнения операции логического И над результатами, возвращёнными благодаря использованию двух других ключей |

```bash
lsof -a -p $$ -d 0,1,2
```
> `$$` - PID текущего процесса

```bash
#!/bin/bash

exec 3> myfile1
exec 6> myfile2
exec 7< myfile3
lsof -a -p $$ -d 0,1,2,3,6,7
```

#### Подавление вывода
```bash
ls -al badfile anotherfile 2> /dev/null
```

#### Очистка файла
```bash
cat /dev/null > myfile
: > myfile
> myfile
```

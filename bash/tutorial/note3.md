# Bash-скрипты, часть 3: параметры и ключи командной строки

#### Чтение параметров командной строки
```bash
#!/bin/bash

echo $0
echo $1
echo $2
echo $3
echo ${10}

```

```bash
./myscript 5 10 15
```

#### Проверка параметров
```bash
#!/bin/bash

if [ -n "$1" ]
then
    echo Hello $1.
else
    echo "No parameters found. "
fi
```

#### Подсчёт параметров
```bash
#!/bin/bash

echo There were $# parameters passed.
```

#### Последний параметр
```bash
#!/bin/bash

echo The last parameter was ${!#}
```

#### Захват всех параметров командной строки
```bash
#!/bin/bash

echo "Using the \$* method: $*"
echo "-----------"
echo "Using the \$@ method: $@"
```
Переменная `$*` содержит все параметры, введённые в командной строке, в виде единого «слова».

В переменной `$@` параметры разбиты на отдельные «слова». Эти параметры можно перебирать в циклах.
```bash
#!/bin/bash

count=1
for param in "$*"
do
    echo "\$* Parameter #$count = $param"
    count=$(( $count + 1 ))
done

count=1
for param in "$@"
do
    echo "\$@ Parameter #$count = $param"
    count=$(( $count + 1 ))
done
```

#### Команда shift
```bash
#!/bin/bash

count=1
while [ -n "$1" ]
do
    echo "Parameter #$count = $1"
    count=$(( $count + 1 ))
    shift
done
```

#### Ключи командной строки
```bash
#!/bin/bash

while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option" ;;
        -b) echo "Found the -b option" ;;
        -c) echo "Found the -c option" ;;
        *) echo "$1 is not an option" ;;
    esac
    shift
done
```

```bash
./myscript –a –b –c –d
```

#### Как различать ключи и параметры
```bash
#!/bin/bash

while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option" ;;
        -b) echo "Found the -b option";;
        -c) echo "Found the -c option" ;;
        --) shift
            break ;;
        *) echo "$1 is not an option";;
    esac
    shift
done

count=1
for param in $@
do
    echo "Parameter #$count: $param"
    count=$(( $count + 1 ))
done
```

```bash
./myscript –a –b –c –- 5 10 15
```

#### Обработка ключей со значениями
```bash
#!/bin/bash

while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) param="$2"
            echo "Found the -b option, with parameter value $param"
            shift ;;
        -c) echo "Found the -c option";;
        --) shift
            break ;;
        *) echo "$1 is not an option";;
    esac
    shift
done

count=1
for param in "$@"
do
    echo "Parameter #$count: $param"
    count=$(( $count + 1 ))
done
```
```bash
./myscript -a -b test1 -d
```

#### Использование стандартных ключей
В мире Linux значения некоторых ключей стали чем-то вроде стандарта, которого полезно придерживаться. Вот список этих ключей:

| Ключ | Описание |
| --- | --- |
| -a | Вывести все объекты. |
| -c | Произвести подсчёт. |
| -d | Указать директорию. |
| -e | Развернуть объект. |
| -f | Указать файл, из которого нужно прочитать данные. |
| -h | Вывести справку по команде. |
| -i | Игнорировать регистр символов. |
| -l | Выполнить полноформатный вывод данных. |
| -n | Использовать неинтерактивный (пакетный) режим. |
| -o | Позволяет указать файл, в который нужно перенаправить вывод. |
| -q | Выполнить скрипт в quiet-режиме. |
| -r | Обрабатывать папки и файлы рекурсивно. |
| -s | Выполнить скрипт в silent-режиме. |
| -v | Выполнить многословный вывод. |
| -x | Исключить объект. |
| -y | Ответить «yes» на все вопросы. |

#### Получение данных от пользователя
```bash
#!/bin/bash

echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program."
```
> Ключ `-n` у echo позволяет сделать ввод данных на той же строке

Можно указать несколько переменных
```bash
#!/bin/bash

read -p "Enter your name: " first last
echo "Your data for $last, $first…"
```
> Ключ `-p` у read позволяет сделать ввод данных на той же строке
`REPLY` дефолтная переменная, если не указана другая
```bash
#!/bin/bash

read -p "Enter your name: "
echo Hello $REPLY, welcome to my program.
```
`-t` таймаут ожидания
```bash
#!/bin/bash

if read -t 5 -p "Enter your name: " name
then
echo "Hello $name, welcome to my script"
else
echo "Sorry, too slow! "
fi
```

#### Ввод паролей
```bash
#!/bin/bash

read -s -p "Enter your password: " pass
echo "Is your password really $pass? "
```

#### Чтение данных из файла
```bash
#!/bin/bash

count=1
cat myfile | while read line
do
    echo "Line $count: $line"
    count=$(( $count + 1 ))
done
echo "Finished"
```

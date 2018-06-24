# Bash-скрипты, часть 6: функции и разработка библиотек

#### Использование функций
```bash
#!/bin/bash

function myfunc {
    echo "This is an example of using a function"
}

count=1
while [ $count -le 3 ]; do
    myfunc
    count=$(( $count + 1 ))
done

echo "This is the end of the loop"
myfunc
echo "End of the script"
```

#### Использование команды return
```bash
#!/bin/bash

function myfunc {
    read -p "Enter a value: " value
    echo "adding value"
    return $(( $value + 10 ))
}

myfunc
echo "The new value is $?"
```
> `$?` тут будет последнее return значение. Внимание, максимальное число для возврата 255

#### Запись вывода функции в переменную
```bash
#!/bin/bash

function myfunc {
    read -p "Enter a value: " value
    echo $(( $value + 10 ))
}
result=$(myfunc)
echo "The value is $result"
```

#### Аргументы функций
```bash
#!/bin/bash

function addnum {
  if [ $# -eq 0 ] || [ $# -gt 2 ]; then
    echo -1
  elif [ $# -eq 1 ]; then
    echo $(( $1 + $1 ))
  else
    echo $(( $1 + $2 ))
  fi
}

echo -n "Adding 10 and 15: "
value=$(addnum 10 15)
echo $value

echo -n "Adding one number: "
value=$(addnum 10)
echo $value

echo -n "Adding no numbers: "
value=$(addnum)
echo $value

echo -n "Adding three numbers: "
value=$(addnum 10 15 20)
echo $value
```

#### Работа с переменными в функциях
Глобальные переменные

Локальные переменные
```bash
#!/bin/bash

function myfunc {
  local temp=$[ $value + 5 ]
  echo "The Temp from inside function is $temp"
}

value=2
temp=4
myfunc
echo "The temp from outside is $temp"
```

#### Передача функциям массивов в качестве аргументов
```bash
#!/bin/bash

function myfunc {
  local newarray
  newarray=("$@")
  echo "The new array value is:"
  for value in "${newarray[@]}" ; do
    echo "  $value"
  done
}

myarray=(1 "2 3" "4 5")
echo "The original array is:"
for value in "${myarray[@]}" ; do
  echo "  $value"
done

myfunc "${myarray[@]}"
```
> ! Такую магию лучше не использовать

#### Рекурсивные функции
```bash
#!/bin/bash

function factorial {
  if [ $1 -eq 1 ]; then
    echo 1
  else
    local temp=$(( $1 - 1 ))
    local result=$(factorial $temp)
    echo $(( $result * $1 ))
  fi
}

read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"
```

#### Создание и использование библиотек
```bash
Библиотека
function addnum {
  echo $(( $1 + $2 ))
}
```
Использование
```bash
#!/bin/bash

. ./myfuncs
result=$(addnum 10 20)
echo "The result is: $result"
```

#### Примечания
> `$0` внутри функции это все еще название скрипта

# Bash-скрипты, часть 5: сигналы, фоновые задачи, управление сценариями

#### Сигналы Linux

| Код сигнала | Название | Описание |
| --- | --- | --- |
| 1 | SIGHUP | Закрытие терминала |
| 2 | SIGINT | Сигнал остановки процесса пользователем с терминала (CTRL + C)
| 3 | SIGQUIT | Сигнал остановки процесса пользователем с терминала (CTRL + \\) с дампом памяти
| 9 | SIGKILL | Безусловное завершение процесса
| 15 | SIGTERM | Сигнал запроса завершения процесса |
| 17 | SIGSTOP | Принудительная приостановка выполнения процесса, но не завершение его работы |
| 18 | SIGTSTP | Приостановка процесса с терминала (CTRL + Z), но не завершение работы |
| 19 | SIGCONT | Продолжение выполнения ранее остановленного процесса |

Просмотреть приостановленные задания можно такой командой
```bash
ps –l
```
Завершить работу приостановленного процесса
```bash
kill processID
```

#### Перехват сигналов

```bash
#!/bin/bash

trap "echo ' Trapped Ctrl-C'" SIGINT
echo This is a test script
count=1
while [ $count -le 10 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
```

#### Перехват сигнала выхода из скрипта
```bash
#!/bin/bash

trap "echo Goodbye..." EXIT
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
```

#### Модификация перехваченных сигналов и отмена перехвата
Модификация
```bash
#!/bin/bash

trap "echo 'Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done

trap "echo ' I modified the trap!'" SIGINT
count=1
while [ $count -le 5 ]
do
    echo "Second Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
```
Отмена
```bash
#!/bin/bash

trap "echo 'Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]
do
    echo "Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done

trap -- SIGINT
echo "I just removed the trap"
count=1
while [ $count -le 5 ]
do
    echo "Second Loop #$count"
    sleep 1
    count=$(( $count + 1 ))
done
```

#### Выполнение сценариев командной строки в фоновом режиме
```bash
#!/bin/bash
count=1
while [ $count -le 10 ]
do
    sleep 1
    count=$(( $count + 1 ))
done
```
```bash
./myscipt &
```

#### Выполнение скриптов, не завершающих работу при закрытии терминала
```bash
nohup ./myscript &
```

#### Просмотр заданий
```bash
jobs -l
```
> Ключ -l при вызове команды jobs указывает на то, что нам нужны сведения об ID процессов.

#### Перезапуск приостановленных заданий
После паузы запустит процесс в фоновом режиме
```bash
bg
```
После паузы запустит процесс в обычном режиме
```bash
fg 1
```
> 1 это номер запущенного процесса, если их несколько и нужно указать какой

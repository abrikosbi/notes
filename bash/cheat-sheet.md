# Cheat sheet


### Системная информация
| Команда | Описание |
| --- | --- |
| uname -m | отобразить архитектуру компьютера |
| uname -r | отобразить используемую версию ядра |
| dmidecode -q | показать аппаратные системные компоненты - (SMBIOS / DMI) |
| hdparm -i /dev/sda | вывести характеристики жесткого диска |
| hdparm -tT /dev/sda | протестировать производительность чтения данных с жесткого диска |
| cat /proc/cpuinfo | отобразить информацию о процессоре |
| cat /proc/interrupts | показать прерывания |
| cat /proc/meminfo | проверить использование памяти |
| cat /proc/swaps | показать файл(ы) подкачки |
| cat /proc/version | вывести версию ядра |
| cat /proc/net/dev | показать сетевые интерфейсы и статистику по ним |
| cat /proc/mounts | отобразить смонтированные файловые системы |
| lspci -tv | показать в виде дерева PCI устройства |
| lsusb -tv | показать в виде дерева USB устройства |
| date | вывести системную дату |
| cal 2018 | вывести таблицу-календарь 2018-го года |
| clock -w | сохранить системное время в BIOS |


### Остановка системы
| Команда | Описание |
| --- | --- |
| shutdown -h now | Остановить систему |
| shutdown -h hours:minutes & | запланировать остановку системы на указанное время |
| shutdown -c | отменить запланированную по расписанию остановку системы |
| shutdown -r now | перегрузить систему |
| reboot |
| logout | выйти из системы |


### Файлы и директории
| Команда | Описание |
| --- | --- |
| cd /home | перейти в директорию '/home' |
| cd .. | перейти в директорию уровнем выше |
| cd ../.. | перейти в директорию двумя уровнями выше |
| cd | перейти в домашнюю директорию |
| cd ~user | перейти в домашнюю директорию пользователя user |
| cd - | перейти в директорию, в которой находились до перехода в текущую директорию |
| pwd | показать текущую директорию |
| ls | отобразить содержимое текущей директории |
| ls -F | отобразить содержимое текущей директории с добавлением к именам символов, храктеризующих тип |
| ls -l | показать детализированое представление файлов и директорий в текущей директории |
| ls -a | показать скрытые файлы и директории в текущей директории |
| ls \*[0-9]\* | показать файлы и директории содержащие в имени цифры |
| tree | показать дерево файлов и директорий, начиная от корня (/) |
| mkdir dir1 | создать директорию с именем 'dir1' |
| mkdir dir1 dir2 | создать две директории одновременно |
| mkdir -p /tmp/dir1/dir2 | создать дерево директорий |
| rm -f file1 | удалить файл с именем 'file1' |
| rmdir dir1 | удалить директорию с именем 'dir1' |
| rm -rf dir1 | удалить директорию с именем 'dir1' и рекурсивно всё её содержимое |
| rm -rf dir1 dir2 | удалить две директории и рекурсивно их содержимое |
| mv dir1 new_dir | переименовать или переместить файл или директорию |
| cp file1 file2 | сопировать файл file1 в файл file2 |
| cp dir/\* . | копировать все файлы директории dir в текущую директорию |
| cp -a /tmp/dir1 . | копировать директорию dir1 со всем содержимым в текущую директорию (`-a` same as `-dR`) |
| cp -a dir1 dir2 | копировать директорию dir1 в директорию dir2 |
| ln -s file1 lnk1 | создать символическую ссылку на файл или директорию |
| ln file1 lnk1 | создать "жёсткую" (физическую) ссылку на файл или директорию |
| touch -t 0712250000 fileditest | модифицировать дату и время создания файла, при его отсутствии, создать файл с указанными датой и временем (YYMMDDhhmm) |


### Поиск файлов
| Команда | Описание |
| --- | --- |
| find / -name file1 | найти файлы и директории с именем file1. Поиск начать с корня (/) |
| find / -user user1 | найти файл и директорию принадлежащие пользователю user1. Поиск начать с корня (/) |
| find /home/user1 -name "*.bin" | Найти все файлы и директории, имена которых оканчиваются на '. bin'. Поиск начать с '/ home/user1' |
| find /usr/bin -type f -atime +100 | найти все файлы в '/usr/bin', время последнего обращения к которым более 100 дней |
| find /usr/bin -type f -mtime -10 | найти все файлы в '/usr/bin', созданные или изменённые в течении последних 10 дней |
| find / -name *.rpm -exec chmod 755 '{}' \; | найти все фалы и директории, имена которых оканчиваются на '.rpm', и изменить права доступа к ним |
| find / -xdev -name "*.rpm" | найти все фалы и директории, имена которых оканчиваются на '.rpm', игнорируя съёмные носители, такие как cdrom, floppy и т.п. |
| locate "*.ps" | найти все файлы, сожержащие в имени '.ps'. Предварительно рекомендуется выполнить команду 'updatedb' |
| whereis halt | показывает размещение бинарных файлов, исходных кодов и руководств, относящихся к файлу 'halt' |
| which halt | отображает полный путь к файлу 'halt' |


### Дисковое пространство
| Команда | Описание |
| --- | --- |
| df -h | отображает информацию о смонтированных разделах с отображением общего, доступного и используемого пространства |
| ls -lSR &#124; less | выдаёт список файлов и директорий рекурсивно с сортировкой по возрастанию размера и позволяет осуществлять постраничный просмотр |
| du -sh dir1 | подсчитывает и выводит размер, занимаемый директорией 'dir1' |
| du -sk * &#124; sort -rn | отображает размер и имена файлов и директорий, с соритровкой по размеру |
| dpkg-query -W -f='${Installed-Size;10}\t${Package}\n' &#124; sort -k1,1n | показывает размер используемого дискового пространства, занимаемое файлами deb-пакета, с сортировкой по размеру |
[//]: # (TODO опробовать команду)


### Пользователи и группы
| Команда | Описание |
| --- | --- |
| groupadd group_name | создать новую группу с именем group_name |
| groupdel group_name | удалить группу group_name |
| groupmod -n new_group_name old_group_name | переименовать группу old_group_name в new_group_name |
| useradd -c "Nome Cognome" -g admin -d /home/user1 -s /bin/bash user1 | создать пользователя user1, назначить ему в качестве домашнего каталога /home/user1, в качестве shell'а /bin/bash, включить его в группу admin и добавить комментарий Nome Cognome |
| useradd user1 | создать пользователя user1 |
| userdel -r user1 | удалить пользователя user1 и его домашний каталог |
| usermod -c "User FTP" -g system -d /ftp/user1 -s /bin/nologin user1 | изменить атрибуты пользователя |
| passwd | сменить пароль |
| passwd user1 | сменить пароль пользователя user1 (только root) |
| chage -E 2005-12-31 user1 | установить дату окончания действия учётной записи пользователя user1 |
| pwck | проверить корректность системных файлов учётных записей. Проверяются файлы /etc/passwd и /etc/shadow |
| grpck | проверяет корректность системных файлов учётных записей. Проверяется файл/etc/group |
| newgrp [-] group_name | изменяет первичную группу текущего пользователя. Если указать "-", ситуация будет идентичной той, в которой пользователь вышел из системы и снова вошёл. Если не указывать группу, первичная группа будет назначена из /etc/passwd |


### Выставление/изменение полномочий на файлы
| Команда | Описание |
| --- | --- |
| ls -lh | просмотр полномочий на файлы и директории в текущей директории |
| ls /tmp &#124; pr -T5 -W$COLUMNS | вывести содержимое директории /tmp и разделить вывод на пять колонок |
| chmod ugo+rwx directory1 | добавить полномочия на директорию directory1 ugo(User Group Other)+rwx(Read Write eXecute) - всем полные права. Аналогичное можно сделать таким образом "chmod 777 directory1" |
| chmod go-rwx directory1 | отобрать у группы и всех остальных все полномочия на директорию directory1. |
| chown user1 file1 | назначить владельцем файла file1 пользователя user1 |
| chown -R user1 directory1 | назначить рекурсивно владельцем директории directory1 пользователя user1 |
| chgrp group1 file1 | сменить группу-владельца файла file1 на group1 |
| chown user1:group1 file1 | сменить владельца и группу владельца файла file1 |
| find / -perm -u+s | найти, начиная от корня, все файлы с выставленным SUID |
| chmod u+s /bin/binary_file | назначить SUID-бит файлу /bin/binary_file. Это даёт возможность любому пользователю запускать на выполнение файл с полномочиями владельца файла. |
| chmod u-s /bin/binary_file | снять SUID-бит с файла /bin/binary_file. |
| chmod g+s /home/public | назначить SGID-бит директории /home/public. |
| chmod g-s /home/public | снять SGID-бит с директории /home/public. |
| chmod o+t /home/public | назначить STIKY-бит директории /home/public. Позволяет удалять файлы только владельцам |
| chmod o-t /home/public | снять STIKY-бит с директории /home/public |


### Специальные атрибуты файлов
| Команда | Описание |
| --- | --- |
| chattr +a file1 | позволить открывать файл на запись только в режиме добавления |
| chattr +c file1 | позволяет ядру автоматически сжимать/разжимать содержимое файла. |
| chattr +d file1 | указавет утилите dump игнорировать данный файл во время выполнения backup'а |
| chattr +i file1 | делает файл недоступным для любых изменений: редактирование, удаление, перемещение, создание линков на него. |
| chattr +s file1 | позволяет сделать удаление файла безопасным, т.е. выставленный атрибут s говорит о том, что при удалении файла, место, занимаемое файлом на диске заполняется нулями, что предотвращяет возможность восстановления данных. |
| chattr +S file1 | указывает, что, при сохранении изменений, будет произведена синхронизация, как при выполнении команды sync |
| chattr +u file1 | данный атрибут указывает, что при удалении файла содержимое его будет сохранено и при необходимости пользователь сможет его восстановить |
| lsattr | показать атрибуты файлов |


### Архивирование и сжатие файлов
| Команда | Описание |
| --- | --- |
| gzip file1 | сжимает файл 'file1', заменяя его на 'file.gz' |
| gunzip file1.gz | разжимает файл 'file1.gz', заменяя его на 'file1' |
| tar -cvf archive.tar file1 file2 dir1 | создать tar-архив archive.tar, содержащий файл file1, file2 и dir1 |
| tar -cvzf archive.tar.gz dir1 | создать архив и сжать его с помощью gzip |
| tar -tf archive.tar | показать содержимое архива |
| tar -xvf archive.tar | распаковать архив |
| tar -xvf archive.tar -C /tmp | распаковать архив в /tmp |
| tar -xvfz archive.tar.gz | разжать архив и распаковать его |
| zip file1.zip file1 | создать сжатый zip-архив |
| zip -r file1.zip file1 file2 dir1 | создать сжатый zip-архив и со включением в него нескольких файлов и/или директорий |
| unzip file1.zip | разжать и распаковать zip-архив |
| zipinfo file.zip | информация по архиву |
| unzip all.zip file.txt -d . | распаковать из архива только файл file.txt


### DEB пакеты
| Команда | Описание |
| --- | --- |
| dpkg -i package.deb | установить / обновить пакет |
| dpkg -r package_name | удалить пакет из системы |
| dpkg -l | показать все пакеты, установленные в систему |
| dpkg -l &#124; grep httpd | среди всех пакетов, установленных в системе, найти пакет содержащий в своём имени "httpd" |
| dpkg -s package_name | отобразить инфрмацию о конкретном пакете |
| dpkg -L package_name | вывести список файлов, входящих в пакет, установленный в систему |
| dpkg --contents package.deb | отобразить список файлов, входящих в пакет, который ешё не установлен в систему |
| dpkg -S /bin/ping | найти пакет, в который входит указанный файл. |
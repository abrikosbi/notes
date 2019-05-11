# grep

| Команда | Описание |
| --- | --- |
| grep Aug /var/log/messages | из файла '/var/log/messages' отобрать и вывести на стандартное устройство вывода строки, содержащие "Aug" |
| grep ^Aug /var/log/messages | из файла '/var/log/messages' отобрать и вывести на стандартное устройство вывода строки, начинающиеся на "Aug" |
| grep -e '[0-9]' /var/log/messages | из файла '/var/log/messages' отобрать и вывести на стандартное устройство вывода строки, содержащие цифры |
| grep Aug -R /var/log/* | отобрать и вывести на стандартное устройство вывода строки, содержащие "Aug", во всех файлах, находящихся в директории /var/log и ниже (рекурсивно. -R, -r, --recursive) |
| grep -r --include "*.md" "search" ./commands/ | ищет в файлах определенного шаблона (find commands -name "*.md" | xargs grep search) |
| grep "http." ./ | ищет в файлах определенного шаблона (find commands -name "*.md" | xargs grep search) |


| Ключи | Описание |
| --- | --- |
| -n | Номера строк |
| -A 2 | вывести две строки после той, что сматчилась |
| -B 3 | вывести три строки перед той, что сматчилась |
| -С 4 | контекст. 4 до и 4 после строки |

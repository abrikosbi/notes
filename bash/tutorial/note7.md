# Bash-скрипты, часть 7: sed и обработка текстов

#### Основы работы с sed
```bash
echo "This is a test" | sed 's/test/another test/'
sed 's/test/another test' ./myfile
```

#### Выполнение наборов команд при вызове sed
```bash
echo "This is a test" | sed -e 's/This/That/; s/test/another test/'
```

#### Чтение команд из файла
содержимое файла mycommands
```
s/This/That/
s/test/another test/
```
```bash
echo "This is a test" | sed -f mycommands
```

#### Флаги команды замены
| Флаг | Описание |
| --- | --- |
| 2 | При передаче номера учитывается порядковый номер вхождения шаблона в строку, заменено будет именно это вхождение. |
| g | Указывает на то, что нужно обработать все вхождения шаблона, имеющиеся в строке. |
| w file | Указывает команде на то, что нужно записать результаты обработки текста в файл. |

```bash
echo "This is a pattern pattern pattern" | sed 's/pattern/replacement/2'
echo "This is a pattern pattern pattern" | sed 's/pattern/replacement/g'
echo "This is a pattern pattern pattern" | sed 's/pattern/replacement/w output'
```

#### Символы-разделители
```bash
echo "This is a pattern pattern pattern" | sed 's!pattern!replacement!g'
```

#### Выбор фрагментов текста для обработки
```bash
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '2s/pattern/replacement/' 
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '1,3s/pattern/replacement/' # со 1 по 3
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '2,$s/pattern/replacement/' # со 2 до конца
```

#### Удаление строк
```bash
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '2d'
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '1,3d' # со 1 по 3
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '2,$d' # со 2 до конца
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '/2pattern/d' # по шаблону
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed '/2pattern/,/3pattern/d' # по нескольким шаблонамecho "1pattern\n2pattern\n3pattern\n4pattern" | sed '/2pattern/,/3pattern/d' # по нескольким шаблонам
```

#### Вывод номеров строк
```bash
echo "1pattern\n2pattern\n3pattern\n4pattern" | sed -n /2pattern/'='
```
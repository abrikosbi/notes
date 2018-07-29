#!/bin/bash

touch "äïçï÷ïò ÷ïúíåúäîïçï ïëáúáîéñ õóìõç_ÏÂÒÁÚÅÃ.doc"

ls -1 | while read oldname; do
  newname="$(echo "$oldname" |\
             iconv -f utf-8  -t cp1252 |\
             iconv -f koi8-r -t utf-8)"
  mv "$oldname" "$newname"
done

# https://www.linux.org.ru/forum/admin/9731946#comment-9732397

# выжимка
# echo äïçï÷ïò | iconv -f utf-8 -t cp1252 | iconv -f koi8-r -t utf-8
# echo "Êàêèå-òî êðàêîçÿáðû" | iconv -t latin1 | iconv -f cp1251 -t utf-8

# Конвертация нормализованных для мака символов
# echo e<0300>Æ§£Æ‚Æ¢™† ™ ™„‡·„ | iconv -f utf-8-mac -t macRoman | iconv -f cp866 -t utf-8

#!/bin/bash

touch "äïçï÷ïò ÷ïúíåúäîïçï ïëáúáîéñ õóìõç_ÏÂÒÁÚÅÃ.doc"

ls -1 | while read oldname; do
  newname="$(echo "$oldname" |\
             iconv -f utf-8  -t cp1252 |\
             iconv -f koi8-r -t utf-8)"
  mv "$oldname" "$newname"
done

# https://www.linux.org.ru/forum/admin/9731946#comment-9732397

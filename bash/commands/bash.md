# bash
```bash
man bash
bash -c 'echo hello world' # выполняет команду
bash -l # выполняет логин
```

When bash is invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first reads and executes commands from the file /etc/profile, if that file exists.  After reading
       that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and reads and executes commands from the first one that exists and is readable.
```bash
bash -l # выполняет логин
```
When an interactive shell that is not a login shell  is  started,  bash reads  and  executes  commands  from /etc/bash.bashrc and ~/.bashrc, if these files exist.

```bash
# одно и то же
su -l rails
su --login rails
su - rails
```

## Hotkeys
Комбинация | Значение
--- | ---
`ctrl-w` | Удаляет последнее слово в команде
` ctrl-u` | Удаляет команду полностью
`alt-f` | Бежать на слово вперед в команде
`alt-b` | Бежать на слово назад в команде
`ctrl-a` | В начало команды
`ctrl-e` | В конец команды
`ctrl-k` | Удаляет от текущей позиции до конца строки
`ctrl-l` | Очищает экран
`ctrl-x` `ctrl-e` (последовательно) | Открывает текущую команду в редакторе
`ctrl-a` `#` `enter` | Закомментить текущую команду, чтобы можно было вернуться к ней через историю.

[//]: # (TODO проверить alt-# как аналог `ctrl-a` `#` `enter`)


## Советы по работе в командной строке

- Знайте про [ограничение 128Кб](https://wiki.debian.org/CommonErrorMessages/ArgumentListTooLong) в командной строке. Ошибка "Argument list too long" часто бывает, когда маска по имени включает большое количество файлов (в таких случаях помогают варианты с `find` или `xargs`).

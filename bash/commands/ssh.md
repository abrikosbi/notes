# SSH

```bash
$ ssh -V
OpenSSH_7.6p1, LibreSSL 2.6.2
```

## ssh-keygen
| Ключ | Значение | Пример |
| --- | --- | --- |
| -p | замена пароля ключа | `ssh-keygen -p` |
| -R | удаляет hash из known_hosts | `ssh-keygen -R server`, `ssh-keygen -R 127.0.0.1` |

Ключ сервера хранится в **/etc/ssh/ssh_host_rsa_key** и **/etc/ssh/ssh_host_rsa_key.pub**

## ssh-copy-id

```bash
ssh-copy-id [-f] [-n] [-i [identity_file]] [-p port] [-o ssh_option] [user@]hostname
```

| Ключ | Значение |
| --- | --- |
| -n | dry run |
| -f | force mode |
| -h | help |

> вместо `-p` и `-o` лучше предпочитать ssh_config


## scp
```bash
scp path/myfile user@8.8.8.8:/full/path/to/new/location/
scp user@8.8.8.8:/full/path/to/file /path/to/put/here
```


## sshfs
```bash
#!/bin/bash

sshfs desunote.ru:/var/www/desunote.ru/ /media/desunote.ru -o reconnect
```
| Ключ | Значение |
| --- | --- |
| -o reconnect | пытаться пересоединиться вместо ошибок |
| -o idmap=user | Работает она следующим образом: если мы коннектимся как пользователь pupkin@server, а локально работаем как пользователь vasiliy, то мы говорим «считать, что файлы pupkin, это файлы vasiliy». |

```bash
fusermount -u /path
sudo umount -f /path # если зависло
```

## ssh
#### Удалённое исполнение кода
```bash
ssh user@server ls /etc/
```
Некоторые приложения хотят иметь управляющий терминал. Их следует запускать с опцией -t:
```bash
ssh user@server -t remove_command
```

#### Проброс stdin/out
```bash
ssh user@server cat /some/file|awk '{print $2}' | local_app
```
```bash
tar -c * | ssh user@server "cd && tar -x"
```
> Tar запаковывает файлы по маске локально, пишет их в stdout, откуда их читает ssh, передаёт в stdin на удалённом сервере, где их cd игнорирует (не читает stdin), а tar — читает и распаковывает. Так сказать, scp для бедных.

#### Алиасы
```bash
Host ric
        Hostname ооо-рога-и-копыта.рф
        User Администратор
        ForwardX11 yes
        Compression yes
Host home
        Hostname myhome.dyndns.org
        User vasya
        PasswordAuthentication no
```
[//]: # (TODO опробовать ForwardX11 yes)
Все доступные для использования опции можно увидеть в man ssh_config (не путать с sshd_config).


#### Опции по умолчанию
```bash
Host *
User root
Compression yes
```


## Ссылки
* [Магия SSH](https://habr.com/post/331348/)
* [Видео про SSH](https://vimeo.com/54505525)
* [An Illustrated Guide to SSH Agent Forwarding](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html)

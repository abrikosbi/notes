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

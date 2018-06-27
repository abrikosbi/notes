# cd

```bash
cd
cd - # Предыдущая рабочая директория
```
Change the current working directory to directory. If directory is not supplied, the value of the **HOME** shell variable is used. Any additional arguments following directory are ignored. If the shell variable **CDPATH** exists, it is used as a search path: each directory name in **CDPATH** is searched for directory, with alternative directory names in **CDPATH** separated by a colon (‘:’). If directory begins with a slash, **CDPATH** is not used.

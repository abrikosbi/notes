# printf

```bash
➜  printf '%f %b' 4.12 'kuku\n\n434\n'
4.120000 kuku

434
```

| Ключи | Описание |
| --- | --- |
| %s | подставляется строка |
| %b | подставляется строка, но интерпретируются в ней значения типа \n |
| %d | целые числа |
| %f | с плавающей точкой |
| %5d | выравнять пробелами до 5 символов |
| %05d | выравнять нулями до 5 символов |
| %.3f | выводить 3 знака после запятой |

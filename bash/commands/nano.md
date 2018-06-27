# nano

Комбинация привет кэп! | Значение
--- | ---
`←` `↑` `→` `↓` | Навигация
`Home` | Начало строки
`End` | Конец строки
`PgDn` | Страница вниз
`PgUp` | Страниц вверх


Комбинация | Значение
--- | ---
`^G`      (`F1`)          |  Показать help
`^X`      (`F2`)          |  Закрыть файл и выйти
`^O`      (`F3`)          |  Сохранить на диск
`^J`      (`F4`)          |  Justify the current paragraph
`^R`      (`F5`)          |  Insert another file into the current one
`^W`      (`F6`)          |  Search for a string or a regular expression
`^Y`      (`F7`)          |  Move to the previous screen
`^V`      (`F8`)          |  Move to the next screen
`^K`      (`F9`)          |  Cut the current line and store it in the cutbuffer
`^U`      (`F10`)         |  Uncut from the cutbuffer into the current line
`^C`      (`F11`)         |  Display the position of the cursor
`^T`      (`F12`)         |  Invoke the spell checker, if available
`^_`      (`F13`)   (`M-G`) |  Go to line and column number
`^\`      (`F14`)   (`M-R`) |  Replace a string or a regular expression
`^^`      (`F15`)   (`M-A`) |  Mark text at the cursor position
`M-}`                   |  Indent the current line
`M-{`                   |  Unindent the current line
`^F`                    |  Move forward one character
`^B`                    |  Move back one character
`^P`                    |  Move to the previous line
`^N`                    |  Move to the next line
`^A`                    |  Move to the beginning of the current line
`^E`                    |  Move to the end of the current line
`M-]`                   |  Move to the matching bracket
`M-<`             (`M-,`) |  Switch to the previous file buffer
`M->`             (`M-.`) |  Switch to the next file buffer
`M-V`                   |  Insert the next keystroke verbatim
`^I`                    |  Insert a tab at the cursor position
`^M`                    |  Insert a newline at the cursor position
`^D`                    |  Delete the character under the cursor
`^H`                    |  Delete the character to the left of the cursor
`M-T`                   |  Cut from the cursor position to the end of the file
`M-J`                   |  Justify the entire file
`M-D`                   |  Count the number of words, lines, and characters
`^L`                    |  Refresh (redraw) the current screen
`M-X`                   |  Help mode enable/disable
`M-C`                   |  Constant cursor position display enable/disable
`M-O`                   |  Use of one more line for editing enable/disable
`M-S`                   |  Smooth scrolling enable/disable
`M-P`                   |  Whitespace display enable/disable
`M-Y`                   |  Color syntax highlighting enable/disable
`M-H`                   |  Smart home key enable/disable
`M-I`                   |  Auto indent enable/disable
`M-K`                   |  Cut to end enable/disable
`M-L`                   |  Long line wrapping enable/disable
`M-Q`                   |  Conversion of typed tabs to spaces enable/disable
`M-B`                   |  Backup files enable/disable
`M-F`                   |  Multiple file buffers enable/disable
`M-M`                   |  Mouse support enable/disable
`M-N`                   |  No conversion from DOS/Mac format enable/disable
`M-Z`                   |  Suspension enable/disable
[//]: # (TODO поудалять лишнее)

#### Навигация
Комбинация | Значение
--- | ---
`Ctrl-Space` | На слово вперед
`Alt-Space` | На слово назад
`Alt-\` | В начало файла
`Alt-/` | В конец файла
`Alt-0` | До первой пустой строки вниз
`Alt-9` | До первой пустой строки вверх
`Alt--` | Вверх не меняя позиции курсора
`Alt-=` | Вниз не меняя позиции курсора
`Alt-G` | Переход на строку с указанным номером
`Alt-L` | Включить выключить перенос строк
[//]: # (TODO Alt-L не понял как работает, ничего не поменялось)

#### Выделение, копирование, удаление
Комбинация | Значение
--- | ---
`Alt-A` или `Ctrl-^ `| Начало выделения
`Ctrl-K` или `F9` | Удалить
`Alt-6` | Скопировать в буфер обмена
`Ctrl-U` или `F10` | вставить из буфера
`Ctrl-K` | Удаляет сроку или выделенный текст
`Alt-K` | Переключает режим удаления строки (всю или конец строки после курсора)
`Alt-T` | Удаляет все что после курсора до конца файла
`Alt-3` | Комментирование строки. **Юзабельно для крона!**
`Alt-Shift-3` | Показать/Спрятать номера строк (ключ `--linenumber`)

#### undo/redo, поиск/замена
Комбинация | Значение
--- | ---
`Alt-U` | undo
`Alt-E` | redo
`Ctrl-W` | Поиск
`Alt-W` | Следующее совпадение
`Ctrl-\` | Замена

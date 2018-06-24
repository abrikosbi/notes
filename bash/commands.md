# Команды

```bash
find "${DIR1}/" "${DIR2}/" -mindepth 2 -maxdepth 4 -type f -mtime +"${days_process}" -print0 | tee -a /path/to/logs/processed_files.txt | xargs -0 -I{} -P "$(($(nproc) -1))" -n 1 iconv -f "big5" -t "utf-8" -o "{}_processed" {}
```

```bash
LC_ALL=C  echo -n label $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print $2}') '|' $(uptime | sed 's/.*://; s/, / /g') '|' $(date)
```
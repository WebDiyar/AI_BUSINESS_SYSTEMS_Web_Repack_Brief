#!/bin/bash
# Запуск сайта локально. Первый запуск создаёт рабочую копию site/ из source/
# (без CNAME; git не создаётся, используется корневой репозиторий). source/ не трогается.
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -d site ]; then
  cp -R source site
  rm site/CNAME
  echo "Создана рабочая копия site/ (без CNAME)"
fi

port=${PORT:-8000}
while lsof -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; do port=$((port + 1)); done
url="http://127.0.0.1:$port/"

echo "Сайт: $url  (остановка: Ctrl+C)"
(sleep 1; open "$url") &
exec python3 -I -m http.server "$port" --bind 127.0.0.1 --directory site

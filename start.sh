#!/bin/bash
# Запуск сайта локально. Первый запуск создаёт рабочую копию site/ из source/
# с git-историей (исходник -> без CNAME). source/ не трогается.
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -d site ]; then
  cp -R source site
  cd site
  git init -q -b main
  git add -A && git commit -qm "Original snapshot (68786e9)"
  git rm -q CNAME && git commit -qm "Remove CNAME for test deploy"
  cd ..
  echo "Создана рабочая копия site/ (git: исходник + удалён CNAME)"
fi

port=${PORT:-8000}
while lsof -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; do port=$((port + 1)); done
url="http://127.0.0.1:$port/"

echo "Сайт: $url  (остановка: Ctrl+C)"
(sleep 1; open "$url") &
exec python3 -I -m http.server "$port" --bind 127.0.0.1 --directory site

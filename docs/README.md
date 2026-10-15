# AI BUSINESS SYSTEMS — переупаковка сайта: документация

Задача: переделать главную страницу STRATIVON (angletheory.studio) под бренд AI BUSINESS SYSTEMS.
Только оформление и бренд. Тексты, продукты, контакты и функциональность сохраняются.

## Статус этапов

| # | Этап | Файл | Статус | Часы (план) |
|---|------|------|--------|-------------|
| – | Анализ проекта и проверка безопасности | [00-analysis.md](00-analysis.md) | готово | – |
| – | Подготовка: `start.sh`, рабочая копия `site/` | [00-analysis.md](00-analysis.md) | готово | – |
| 0 | Сообщение HR, согласование срока | [stage-0-before-start.md](stage-0-before-start.md) | текст готов, отправка за тобой | – |
| 1 | Скриншоты исходного состояния | [stage-1-baseline.md](stage-1-baseline.md) | готово | 0,5 |
| 2 | Первый экран на согласование | [stage-2-hero.md](stage-2-hero.md) | сделан, ждёт согласования HR | 3 |
| 3 | Вся страница | [stage-3-full-page.md](stage-3-full-page.md) | сделан | 4 |
| 4 | Мета-теги и изображения | [stage-4-meta-images.md](stage-4-meta-images.md) | не начат | 1 |
| 5 | Проверка | [stage-5-checks.md](stage-5-checks.md) | не начат | 2 |
| 6 | Публикация и сдача | [stage-6-delivery.md](stage-6-delivery.md) | отчёт готов: [delivery-report.md](../docs2/delivery-report.md) | 1,5 |

**Вторая волна (материалы из `tg/`, 15.10 вечером):** анализ и безопасность — [tg-analysis.md](../docs2/tg-analysis.md), план работ — [plan-round-2.md](../docs2/plan-round-2.md). Новые требования перекрывают этапы 2–4 выше.

Журнал отчётов HR и фактических часов: [progress-log.md](progress-log.md).
Что нельзя делать: [rules.md](rules.md).

## Где что лежит

| Путь | Что это |
|------|---------|
| `source/` | Оригинал от заказчика. **Не трогать.** |
| `site/` | Рабочая копия. Тут правится `index.html`. `CNAME` удалён, git общий (корневой) |
| `assets/` | Референсы: логотип и панорама (скриншоты) |
| `screenshots/before/` | Скриншоты исходного сайта |
| `screenshots/stage-2/`, `stage-3/` … | Скриншоты результата по этапам (1440 и 390 px) |
| `docs/` | Эта документация |
| `start.sh` | Запуск сайта локально |
| `README.md`, `package.json`, `vercel.json`, `.vercelignore` | Описание проекта, скрипты `npm start/check/preview/deploy`, настройки Vercel |
| `00_…03_*.txt`, `*.pdf` | Материалы заказчика |

## Запуск

```
./start.sh
```

Скрипт сам создаёт `site/` при первом запуске, берёт свободный порт (8000 у тебя занят) и открывает браузер. Остановка: Ctrl+C.
Сервер слушает только `127.0.0.1`, из сети его не видно.

## Настройки VS Code

| Файл | Что делает |
|------|------------|
| `.vscode/settings.json` | Live Server смотрит в `site/`, поиск не лезет в `source/`, PDF и скриншоты |
| `.vscode/tasks.json` | `Cmd+Shift+B` запускает сайт, вторая задача ищет остатки STRATIVON |
| `.vscode/extensions.json` | предлагает поставить Live Server |
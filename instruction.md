### 1. Клонирование репозитория (если еще не сделано)

```bash
git clone <ваш-репозиторий>
cd <папка-проекта>
```

### 2. Сборка и запуск контейнеров
```bash
docker-compose up --build
```

### 3. Проверка работы
После успешного запуска:

Приложение будет доступно по адресу: http://localhost:8080

API будет доступно по адресу: http://localhost:8080/api/

Админка Django: http://localhost:8080/admin/

Работа с контейнерами
Остановка контейнеров

Работа с контейнерами
Остановка контейнеров
bash
docker-compose down
Остановка с удалением томов (включая данные БД)
bash
docker-compose down -v
Перезапуск после изменений
bash
docker-compose up --build
Просмотр логов
bash
docker-compose logs -f
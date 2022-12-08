# Antikot

## Создаем образ для разработки (python3.9, pipenv, 11 нода)
`docker build -t antikot-dev-image -f development.Dockerfile .`
###### Образ создается долго (~5 минут).

## Запускаем контейнер для разработки
`docker run --rm --name="antikot-dev" --net=host -v $PWD:/app -v /var/run/docker.sock:/var/run/docker.sock -it antikot-dev-image bash`

 Запустится bash-строка (дополнительное окно можно вызвать так же командой docker `docker exec -it antikot-dev`).

 Из контейнера запускаем контейнер с PostgreSQL: `docker-compose up -d`.

## Разработка
Входим в виртуальное окружение `pipenv shell`.

Устанавливаем зависимости:

`pipenv install`

`npm i`

Для запуска приложения:
`honcho start`. При этом одновременно запускается бэк на 8000 порту и фронт на 3000 (см. Procfile).

Для установки новых python-зависимостей используем:
`pipenv install <package name>`.





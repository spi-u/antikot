# Antikot

## Создаем образ для разработки (python3.9, pipenv, 11 нода)
`docker build -t antikot-dev-image -f development.Dockerfile .`
###### Образ создается долго (~5 минут).

## Запускаем контейнер для разработки 
`docker run --rm --name="antikot-dev" --net=host -v $PWD:/app -v /var/run/docker.sock:/var/run/docker.sock -it antikot-dev-image bash`

 Запустится bash-строка (дополнительное окно можно вызвать так же командой docker `docker exec -it antikot-dev`).

 Из контейнера запускаем `docker-compose up -d` для запуска Postgres13:9.

 Входим в виртуальное окружение `pipenv shell`

 Устанавливаем зависимости из окружение `pipenv install`

 Серверную часть приложения (FastAPI) можно запустить через honcho: `honcho start` (см. Procfile). Или выполнив `cd server && uvicorn main:app --reload`. Разворачивается на 8000 порту.

## Разработка (серверная часть - FastApi).
Зависимости устанавливаем из окружения в докер контейнере. 
`pipenv install <package name>`
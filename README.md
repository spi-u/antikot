# Antikot
## Настройка окружения Ubuntu >20.04
1. Создаем образ, подробнее в докерфайле `docker build -t antikot-dev-image -f development.Dockerfile .` 
1. Создаем контейнер `docker run -d --name antikot-dev -p 80:80 antikot-dev-image`




FROM python:3.9

RUN apt-get update && \
     apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install project dependencies
RUN apt-get update && \
  apt-get install --yes curl build-essential
RUN apt install nodejs --yes
RUN apt install npm --yes

RUN apt-get install -y libpng-dev python3-setuptools python3-pip
RUN pip install pipenv

# Puppeteer dependencies https://github.com/puppeteer/puppeteer/issues/290#issuecomment-411620091
RUN apt-get update && \
	apt-get install --yes gconf-service libasound2 libatk1.0-0 libc6 \
	libcairo2 libcups2 libdbus-1-3 libexpat1 \
	libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
	libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 \
	libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
	libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 \
	libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 \
	libnss3 lsb-release xdg-utils wget


ENV C_FORCE_ROOT 1
ENV PIPENV_VENV_IN_PROJECT 1
WORKDIR /app

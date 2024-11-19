FROM ubuntu:latest
LABEL author="quodpipax"
LABEL description="yandex disk"

ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8

RUN apt update && apt install -y wget
RUN apt-get install -y gnupg2
RUN apt-get install -y nano
RUN apt-get install -y locales
RUN apt-get install -y language-pack-ru
RUN update-locale LANG=ru_RU.UTF-8
RUN wget -O YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG
RUN apt-key add YANDEX-DISK-KEY.GPG
RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex-disk.list
RUN apt-get update
RUN apt-get install yandex-disk
RUN mkdir /root/Yandex.Disk
ENTRYPOINT ["tail", "-f", "/dev/null"]
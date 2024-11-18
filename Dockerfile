FROM ubuntu:latest
LABEL author="quodpipax"
LABEL description="yandex disk"

RUN apt update && apt install -y wget
RUN apt-get install -y gnupg2
RUN wget -O YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG
RUN apt-key add YANDEX-DISK-KEY.GPG
RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex-disk.list
RUN apt-get update
RUN apt-get install yandex-disk
RUN mkdir /root/Yandex.Disk

ENTRYPOINT ["tail", "-f", "/dev/null"]
FROM node:18-alpine

RUN apk update \
 && apk add --no-cache curl ca-certificates openssl git tar fontconfig tzdata iproute2 bash \
 && adduser -h /home/container container -D

RUN git clone https://github.com/OOP-778/pulsar.git
RUN cd pulsar && npm install && npm run build

WORKDIR /pulsar/

USER container
ENV  USER=container HOME=/home/container

WORKDIR     /home/container/

COPY        entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]

FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y git

FROM mhart/alpine-node

EXPOSE 80

RUN adduser -S ipfs

ENV HOME=/home/ipfs

COPY package.json $HOME/src/
RUN chown -R ipfs $HOME/*

USER ipfs
WORKDIR $HOME/src

RUN npm install && \
    npm cache clean --force

USER root
COPY . $HOME/src
RUN chown -R ipfs $HOME/*

USER ipfs

CMD ["node", "app.js"]

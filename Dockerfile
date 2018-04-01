FROM mhart/alpine-node

EXPOSE 80

RUN adduser -S kinoonik

ENV HOME=/home/kinoonik

COPY package.json $HOME/src/
RUN chown -R kinoonik $HOME/*

USER kinoonik
WORKDIR $HOME/src

RUN npm install && \
    npm cache clean --force

USER root
COPY . $HOME/src
RUN chown -R kinoonik $HOME/*

USER kinoonik

CMD ["node", "app.js"]

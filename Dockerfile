FROM node:11-alpine

RUN apk update && apk add bash
RUN apk update && apk add --virtual build-dependenciess build-base gcc make git

RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

USER node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm i -g typescript gulp polymer-cli

ENV PATH="/home/node/.npm-global/bin:${PATH}"
WORKDIR /usr/src/app

CMD /bin/bash
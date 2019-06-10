FROM node:lts-alpine

WORKDIR /app

COPY package.json /app

RUN npm i --engine-strict=true --progress=false --loglevel="error" \
    && npm cache clean --force

COPY canon.js /app

CMD [ "npm", "start" ]

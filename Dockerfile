FROM node:20.12 AS base

WORKDIR /eval

COPY . . 

RUN npm install yarn

RUN yarn install 

RUN yarn tsc

RUN node ace build 

EXPOSE 3333

CMD ["/bin/bash","-c","node ace migration:run && node ./build/bin/server.js"]


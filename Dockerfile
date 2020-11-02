FROM node:8.17.0-slim

WORKDIR /usr/src/app

RUN apt update -y \
 && apt install git -y \
 && git clone https://github.com/surveyjs/surveyjs_angular_cli.git /usr/src/app \
 && sed -i -e 's/"start": "ng serve"/"start": "ng serve --host 0.0.0.0"/g' package.json \
 && npm install

EXPOSE 4200
CMD [ "npm", "start" ]

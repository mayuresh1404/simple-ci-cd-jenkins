FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN chmod -R 755 /app

EXPOSE 8080
CMD ["npm", "start"]




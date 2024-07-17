FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npx nx build catalog

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "-s", "dist/apps/catalog", "-l", "3000"]


# docker build -t fe_react . 
# docker run -d --name fe_react_container -p 3000:3000 fe_react 
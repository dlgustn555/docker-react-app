FROM node as builder

WORKDIR /lee/apps/docker-react-app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /lee/apps/docker-react-app/build /usr/share/nginx/html



FROM node:alpine
WORKDIR /opt/the-tap
ADD . .
RUN npm install -g webpack-cli http-server && \
    npm run webpack

EXPOSE 8888
CMD ["http-server", "index.html", "-p", "8888"]

FROM node AS builder
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install --force && ./node_modules/grunt-cli/bin/grunt


FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app /usr/share/nginx/html
COPY docker/nginx.conf /etc/nginx/nginx.conf
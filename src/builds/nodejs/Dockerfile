ARG NODEJS_VERSION=alpine
ARG NODEJS_ENV=development
ARG NODEJS_PORT=3000

FROM node:${NODEJS_VERSION} as nodejs

LABEL Sysdomotic <sysdomotic@gmail.com>

WORKDIR /var/www/html/server

# Install system dependencies
RUN apt-get update && apt-get install -y

# Add server files
# ADD ./server /var/www/html/server

# Copy server files
COPY ./server/server.js /var/www/html/server/server.js

# Copy npm packages 
COPY ./server/package.json /var/www/html/server/package.json

# Copy main script
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Run npm packages
# RUN npm init -y
# RUN npm install
# RUN npm install -g nodemon

# Run yarn packages
RUN yarn init -y
RUN yarn install --force

COPY . .

# Permissions
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +

# Environment
ENV NODE_ENV=${NODEJS_ENV}
ENV PORT=${NODEJS_PORT}

ENTRYPOINT ["docker-entrypoint.sh"]

# CMD ["nodemon", "src/server.js", "-w"]

# CMD ["node", "inspect", "server.js"]

CMD ["node", "."]

# CMD ["npm", "run", "dev"]

EXPOSE ${NODEJS_PORT}
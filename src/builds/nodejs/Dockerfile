ARG NODEJS_VERSION=12
ARG NODEJS_PORT=3000

FROM node:${NODEJS_VERSION} as nodejs

LABEL Sysdomotic <sysdomotic@gmail.com>

# Copy server files
COPY server /var/www/html/


# RUN npm init -y
# RUN npm install nodemon -g
RUN npm install -g

WORKDIR /var/www/html

# ENTRYPOINT ["docker-entrypoint.sh"]

# CMD ["nodemon", "server.js"]
CMD ["npm", "run", "dev"]

EXPOSE ${NODEJS_PORT}
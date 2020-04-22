ARG NODEJS_VERSION=alpine
ARG NODEJS_ENV=development
ARG NODEJS_PORT=3001

FROM node:${NODEJS_VERSION} as reactjs

LABEL Sysdomotic <sysdomotic@gmail.com>

WORKDIR /app

# Copy main script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Copy package start project files
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

# Environment
ENV PATH /app/node_modules/.bin:${PATH}

# Run npm packages
RUN npm init -y
RUN npm install --silent
RUN npm install -g react-scripts@3.4.1 --silent

# Create new project
# RUN npm install -g create-react-app
# RUN npx create-react-app .

# Run yarn packages
RUN yarn

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["yarn", "start:ci"]

EXPOSE ${NODEJS_PORT}
FROM node:13-alpine as node

LABEL Sysdomotic <sysdomotic@gmail.com>

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY ./package*.json ./

# Install dependecies
RUN apk add yarn
RUN yarn -g install

# Get all the code needed to run the app
COPY . .

# Run the angular in product
#RUN ng build --prod
#RUN ng serve -o --host 0.0.0.0 --port 4200

EXPOSE 4200
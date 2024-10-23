FROM node:lts-alpine
ENV MONGO_URI=mongodb+srv://vicky:wPiomUG0AfbRE1lp@test-cluster.ieimx.mongodb.net/
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]

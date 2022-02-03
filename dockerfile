FROM node:16-alpine

ENV NODE_ENV=production
ENV PORT=3000

# provided on docker build, don't modify on runtime 
ENV APP_BUILD_SHA=unknown
ENV VERSION=unknown

EXPOSE ${PORT}
USER node

WORKDIR /app
COPY . .

# npm ci won't ever touch package*.json
# --production doesn't install dev-dependencies
# build is there, to fail the docker-build on code errors
RUN npm ci --production && npm run build

CMD node server/express.js
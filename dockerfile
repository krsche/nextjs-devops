FROM node:16-alpine

# expose port 80, or the value of PORT if provided
EXPOSE ${PORT:-3000}

USER node

WORKDIR /app
COPY . .

# npm ci won't ever touch package*.json
# --production doesn't install dev-dependencies
# build is there, to fail the docker-build on code errors
RUN npm ci --production && npm run build

CMD node server/express.js
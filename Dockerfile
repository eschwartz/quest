# syntax=docker/dockerfile:1
FROM node:16

# Use /opt/rearc as the default working directory
# Can use any reasonable folder here, as per your convention
WORKDIR /opt/quest

# See
# https://docs.docker.com/language/nodejs/build-images/
# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

# Express modifies some behavior based on NODE_ENV
# Importantly, express will expose error stacks to the client
# unless NODE_ENV=production, which a security risk.
ENV NODE_ENV=production

# Tell express to listen on port 80
ENV PORT=80

# Install node dependencies
# We do this before copying the rest of the app code in
# so that this operation is cached, and only re-run if dependencies change
# (otherwise, we would need to install at every build
#  which can be slow)
COPY package*.json ./
RUN npm ci --only-production

# Copy the rest of the application
COPY . .

# Export port 80 (http)
# Host port can be modified at run time
# See https://docs.docker.com/engine/reference/run/#expose-incoming-ports
# SSL (443) will terminate at the load balancer
EXPOSE 80

# Default container command:
# Start the server (see package.json start script)
CMD ["npm", "start"]
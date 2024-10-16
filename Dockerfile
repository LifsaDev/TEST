# frontend/Dockerfile
# Pull official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the rest of the app files
COPY . .

# Build the React app
RUN yarn build

# Serve the built app using serve
RUN yarn global add serve

# Expose the port
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "build"]

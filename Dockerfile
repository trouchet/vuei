# Use an official Node.js runtime as a base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY . ./

# Install project dependencies
RUN npm install

# Install pm2 globally
RUN npm install pm2 -g

# Copy all files from the current directory to the working directory
COPY . .

# Expose port 8080 for the Vue app
EXPOSE 3000

# Start the Vue app
CMD ["npm" "run" "serve"]
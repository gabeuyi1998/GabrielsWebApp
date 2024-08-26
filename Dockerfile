# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies ensuring correct architecture binaries are installed
RUN npm install
RUN yarn

# Copy the rest of the application, except node_modules
COPY . /app/.

# Build the app for production
RUN npm run build

# Install serve to serve the build directory
RUN npm install -g serve

# Expose port 5173
EXPOSE 5173

# Command to run the server
CMD ["yarn","serve", "-s", "build", "-l", "5173,"npm" "run", "dev", "--", "--host", "0.0.0.0"]
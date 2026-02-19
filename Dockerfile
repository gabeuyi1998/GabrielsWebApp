# Use Node Alpine
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of code
COPY . .

# Build production app
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Expose port
EXPOSE 5173

# Run production server
CMD ["serve", "-s", "dist", "-l", "5173"]

# Use the official Node.js image as a base
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) for efficient caching
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port your app will run on (Cloud Run default is 8080)
EXPOSE 8080

# Start the application (Cloud Run expects the "start" script)
CMD ["npm", "start"]

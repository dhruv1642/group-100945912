# Use an official Node.js runtime as the base image
FROM node:16-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if exists) to install dependencies first
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port the app will run on (Next.js usually runs on port 3000, but you might need to adjust it)
EXPOSE 3000

# Set environment variable for Next.js (if using Next.js)
ENV NODE_ENV production

# Run the Next.js build process (only needed for Next.js, remove if not using Next.js)
RUN npm run build

# Start the application
CMD ["npm", "start"]

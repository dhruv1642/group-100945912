# Step 1: Use the official Node.js image from the Docker Hub
FROM node:16

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json first for better layer caching
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of your application code into the container
COPY . .

# Step 6: Expose the port the app runs on
EXPOSE 8080

# Step 7: Command to run your app
CMD ["npm", "start"]

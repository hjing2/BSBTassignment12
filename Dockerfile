# Base image
FROM node:18 AS Build

# Set the working directory
WORKDIR /jing_haodan_ui_garden

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /jing_haodan_ui_garden/node_modules/.bin:$PATH

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Set the environment variable to serve the built files
ENV HOST=0.0.0.0
ENV PORT=8083

# Expose port 8083
EXPOSE 8083

# Start the application
CMD ["npm", "run", "storybook"]

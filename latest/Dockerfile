FROM node:latest

LABEL maintainer="Ryan Bains-Jordan" \
    org.label-schema.name="Express.js" \
    org.label-schema.version="latest"

# Enviornment Variables
ARG PORT=3000
ENV NODE_PORT=$PORT

# Expose ports
EXPOSE $NODE_PORT/tcp

# Set Working directory to node root
WORKDIR /home/node

# Install Express and Nodemon
RUN npm update && \
    npm -y init && \
    npm install express && \
    npm install -D nodemon

# Set up environment
RUN sed -i '/"version".*/a \ \ "type": "module",' package.json && \
    sed -i 's/"test".*/"start": "node index",/' package.json && \
    sed -i '/"start".*/a \ \ \ \ "dev": "nodemon index"' package.json

# Create a server start script
COPY index.js .

# Set Working directory to node root parent
WORKDIR /home

# Load run-time configuration changes
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/home/entrypoint.sh" ]

# Command to start server
CMD ["/bin/bash", "-c", "npm --prefix /home/node run start"]
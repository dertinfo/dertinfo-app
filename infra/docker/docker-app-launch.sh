#!/bin/bash

# ######################################################
# We use a custom start script for the "dertinfo-app" docker container
# as we need to update the location of the API and the callback url for Auth0.
# Whnen we run "docker run" or docker-compose up, we can pass environment variables 
# to the container. Which we use replace the default values in the containers filesystem
# from environment variables.
# ######################################################

# Define the values that we're oging to replace in the configuration file
DEFAULT_API_URL=${DEFAULT_API_URL} # http://localhost:44100/api
DEFAULT_AUTH_CALLBACK_URL=${DEFAULT_AUTH_CALLBACK_URL} # http://loalhost:44300/auth/callback
DEFAULT_ALLOWED_DOMAINS=${DEFAULT_ALLOWED_DOMAINS} # localhost:44100

# Pickup the environment variable values of API_URL and AUTH_CALLBACK_URL and put them into variables
API_URL=${API_URL}
AUTH_CALLBACK_URL=${AUTH_CALLBACK_URL}
ALLOWED_DOMAINS=${ALLOWED_DOMAINS}

# Output the file stucture
ls -l ./

# Get a reference to the configuration file for the app client "app.config.json" at the path src/assets
CONFIG_FILE="./dist/assets/app.config.json"

# Replace the values of the DEFAULT_API_URL with the environment variable value of API_URL
sed -i "s|${DEFAULT_API_URL}|${API_URL}|g" $CONFIG_FILE

# Replace the values of the DEFAULT_AUTH_CALLBACK_URL with the environment variable value of AUTH_CALLBACK_URL
sed -i "s|${DEFAULT_AUTH_CALLBACK_URL}|${AUTH_CALLBACK_URL}|g" $CONFIG_FILE

# Replace the values of the DEFAULT_ALLOWED_DOMAIN with the environment variable value of ALLOWED_DOMAIN
sed -i "s|${DEFAULT_ALLOWED_DOMAIN}|${ALLOWED_DOMAIN}|g" $CONFIG_FILE

# Write the contents of the configuration file to the console
cat $CONFIG_FILE

# Start the static web app inside a docker container
swa start ./dist

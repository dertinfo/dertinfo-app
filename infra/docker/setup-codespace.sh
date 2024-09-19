# ##################
# Description: 
# This script creates environment configuration files for docker-compose to use when running in a codespace. 
# These envionment files allow the dcoker compose to pass envionemtn varibaels to the containers. Which in 
# turn configure the applications with the details. 
# Affects:
# Relevant to running in a codespace only. 
# ##################

# At the location of this shell script, create files for each of the secrets that we want to use. 
# For each of the following environment variables, create a secrets file for reference in docker-compose

# AUTH0_APP_CLIENT_ID - Auth0 client id
# AUTH0_MANAGEMENT_CLIENT_ID - Auth0 management client id
# AUTH0_MANAGEMENT_CLIENT_SECRET - Auth0 management client secret
# AUTH0_WEB_CLIENT_ID - Auth0 web client id
# SENDGRID_API_KEY - SendGrid API key


# ##################
# Setup for the API
# ##################

# For each of the secrets coming in from the codespace environment, add it to the api.env file.
echo "PwaClient__Auth0__ClientId=$AUTH0_APP_CLIENT_ID" > api.env # replace the whole file
echo "Auth0__ManagementClientId=$AUTH0_MANAGEMENT_CLIENT_ID" >> api.env # append to the file from now on
echo "Auth0__ManagementClientSecret=$AUTH0_MANAGEMENT_CLIENT_SECRET" >> api.env
echo "WebClient__Auth0__ClientId=$AUTH0_WEB_CLIENT_ID" >> api.env
echo "SendGrid__ApiKey=$SENDGRID_API_KEY" >> api.env

# ##################
# Setup for the App
# ##################

# As the codespace needs special urls to access forwarded ports then we need to accomodate that for the API and the Auth0 callback url
echo "API_URL=https://$CODESPACE_NAME-44100.app.github.dev/api" > app.env
echo "AUTH_CALLBACK_URL=https://$CODESPACE_NAME-44300.app.github.dev" >> app.env
echo "ALLOWED_DOMAINS=https://$CODESPACE_NAME-44100.app.github.dev" >> app.env
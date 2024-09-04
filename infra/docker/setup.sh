# At the location of this schell script create files for each of the secrets that we want to use. 
# For each of the following envionment varibales create a secrets file for reference in docker-compose

# AUTH0_APP_CLIENT_ID - Auth0 client id
# AUTH0_MANAGEMENT_CLIENT_ID - Auth0 management client id
# AUTH0_MANAGEMENT_CLIENT_SECRET - Auth0 management client secret
# AUTH0_WEB_CLIENT_ID - Auth0 web client id
# SENDGRID_API_KEY - Sendgrid api key

# For each of the secrets coming in from the environment add it to the api.env file.
echo "PwaClient__Auth0__ClientId=$AUTH0_APP_CLIENT_ID" > api.env # replace whats there
echo "Auth0__ManagementClientId=$AUTH0_MANAGEMENT_CLIENT_ID" >> api.env # append to the file from now on
echo "Auth0__ManagementClientSecret=$AUTH0_MANAGEMENT_CLIENT_SECRET" >> api.env
echo "WebClient__Auth0__ClientId=$AUTH0_WEB_CLIENT_ID" >> api.env
echo "SendGrid__ApiKey=$SENDGRID_API_KEY" >> api.env




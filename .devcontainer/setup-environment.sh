#!/bin/bash

# Install global npm packages
npm install -g typescript @azure/static-web-apps-cli azure-functions-core-tools@3 @angular/cli@13

# Append a message to codespace.md
echo '# Writing code upon codespace creation!' >> codespace.md
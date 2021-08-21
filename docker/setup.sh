#!/bin/bash

cp /infranodus/config.json.sample /infranodus/config.json

# Add three empty files which express includes on runtime
cd /infranodus
touch views/statsabove.ejs
touch views/statsbelow.ejs
touch views/statsheader.ejs

# Change secret key
jq -c '.invitation = "secrets.invitation"' \ 
    /infranodus/config.json > tmp.$$.json && mv tmp.$$.json /infranodus/config.json


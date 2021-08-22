FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget \
    curl \
    git \ 
    gnupg \
    jq

# Download customized infranodus
RUN git clone https://github.com/hirotochigi/infranodus

# Install neo4j, node.js, and heroku cli
RUN echo 'deb https://debian.neo4j.org/repo stable/' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    wget --quiet -O - https://debian.neo4j.org/neotechnology.gpg.key | apt-key add - && \
    apt-get update && apt-get install -y neo4j=1:3.5.8 && \ 
    wget --quiet --directory-prefix=/var/lib/neo4j/plugins/ \
    https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.5.0.4/apoc-3.5.0.4-all.jar && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    wget --quiet -O - https://cli-assets.heroku.com/install-ubuntu.sh | sh

# Set up neo4j
RUN  cd /infranodus/docker && \
    bash setup-neo4j.sh 

# Set up infranodus
RUN cp /infranodus/config.json.sample /infranodus/config.json && \
    cd /infranodus && \
    touch views/statsabove.ejs && \
    touch views/statsbelow.ejs && \
    touch views/statsheader.ejs && \
    jq -c '.invitation = "secrets.invitation"' \ 
        /infranodus/config.json > tmp.$$.json && mv tmp.$$.json /infranodus/config.json

WORKDIR infranodus

# Install dependencies of infranodus
RUN npm install

# Start neo4j and infranodus
CMD service neo4j restart && sleep 15s && node app.js


FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget \
    curl \
    git \ 
    gnupg \
    jq

RUN git clone https://github.com/hirotochigi/infranodus

WORKDIR infranodus

RUN  cd docker \
    ./install-packages.sh \
    ./setup-neo4j.sh \
    ./setup.sh \
    
CMD node app.js


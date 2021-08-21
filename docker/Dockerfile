FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget \
    curl \
    git \ 
    gnupg \
    jq

RUN git clone https://github.com/hirotochigi/infranodus


RUN echo 'deb https://debian.neo4j.org/repo stable/' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    wget --quiet -O - https://debian.neo4j.org/neotechnology.gpg.key | apt-key add - && \
    apt-get update && apt-get install -y neo4j=1:3.5.8 && \ 
    wget --quiet --directory-prefix=/var/lib/neo4j/plugins/ \
    https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.5.0.4/apoc-3.5.0.4-all.jar && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs 

RUN  cd /infranodus/docker && \
    bash setup-neo4j.sh && \
    bash setup.sh 

WORKDIR infranodus
    
CMD node app.js


FROM ubuntu:latest
USER root


RUN apt-get update -yq \
  && apt-get install curl gnupg -yq \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash \
  && apt-get install nodejs -yq \
  apt-utils \
  strace \
  graphviz \
  && apt-get install openjdk-8-jre -yq



RUN apt-get install yarn -yq

RUN apt-get install chromium-browser -yq
 
ENV PUPPETEER_SKIP_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin


RUN npm i -g puppeteer

RUN npm i -g puppeteer-core


# Install C4Builder
RUN npm i -g c4builder

RUN mkdir -p /c4 && chown -R root:root /c4
WORKDIR /c4
COPY  . /c4 

EXPOSE 3000

CMD [ "c4builder", "site" ]
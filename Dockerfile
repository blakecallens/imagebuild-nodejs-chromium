FROM debian:stretch

RUN apt-get update && apt-get install -y xvfb chromium curl gnupg

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs git && npm install -g npm@latest

WORKDIR /usr/src/app

CMD npm test


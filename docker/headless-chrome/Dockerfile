FROM node:10-alpine

# Documentation:
#
# https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#running-on-alpine

# Installs latest Chromium (73) package.
RUN apk update && apk upgrade && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
  apk add --no-cache \
  chromium@edge=~73.0.3683.103 \
  nss@edge \
  freetype@edge \
  freetype-dev@edge \
  harfbuzz@edge \
  ttf-freefont@edge

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV NODE_PATH /usr/local/lib/node_modules

# Puppeteer v1.12.2 works with Chromium 73.
RUN npm install -g puppeteer@1.12.2 yargs luxon

COPY common.js     /common.js
COPY pdf.js        /pdf.js
COPY screenshot.js /screenshot.js

WORKDIR /data

VOLUME ["/data"]

ENTRYPOINT ["node", "/screenshot.js"]

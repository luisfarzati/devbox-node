FROM node:6
MAINTAINER Luis Farzati <lfarzati@gmail.com>
LABEL Description="This image is used to start the foobar executable" Version="1.0"

RUN npm install -g \
  babel-cli \
  babel-core \
  babel-eslint \
  babel-plugin-transform-es2015-modules-commonjs \
  babel-preset-es2017 \
  eslint \
  eslint-config-standard \
  eslint-plugin-import \
  eslint-plugin-json \
  eslint-plugin-no-inferred-method-name \
  eslint-plugin-no-loops \
  eslint-plugin-promise \
  eslint-plugin-standard \
  nodemon

RUN mkdir -p /etc/nodeapp
COPY eslintrc.json /etc/nodeapp

COPY autorun /usr/local/bin
COPY autolint /usr/local/bin
RUN chmod +x /usr/local/bin/autorun
RUN chmod +x /usr/local/bin/autolint

VOLUME /var/nodeapp
WORKDIR /var/nodeapp

EXPOSE 3000

CMD ["babel-node", "--presets", "/usr/local/lib/node_modules/babel-preset-es2017", "--plugins", "/usr/local/lib/node_modules/babel-plugin-transform-es2015-modules-commonjs", "--", "index.js"]

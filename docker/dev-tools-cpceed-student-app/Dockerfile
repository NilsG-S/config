FROM nilsgs/config:dev-tools

# Installing dependencies
RUN apt update \
  && apt install -y curl=7.58.0-2ubuntu3.2 \
  && curl https://nodejs.org/dist/v10.9.0/node-v10.9.0-linux-x64.tar.xz --output node.tar.xz --silent \
  && tar -xf node.tar.xz --directory /usr/local --strip-components 1 \
  && rm node.tar.xz \
  && curl -o- -L https://yarnpkg.com/install.sh | bash

WORKDIR /project

# Run container as an executable login shell
ENTRYPOINT ["bash", "-l"]

FROM ubuntu:18.04

ENV TERM xterm-256color

# Installing dependencies
RUN apt update \
  && apt install -y \
  man \
  git \
  # This includes SCP
  openssh-server

COPY configs/profile/.profile /root/.profile

WORKDIR /project

# Run container as an executable login shell
ENTRYPOINT ["bash", "-l"]

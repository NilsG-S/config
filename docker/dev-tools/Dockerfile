FROM ubuntu:18.04

ENV TERM xterm-256color

# Installing dependencies
RUN apt update \
  && apt install -y \
  man \
  git \
  # Does this include scp?
  openssh-server

WORKDIR /project

# Configures container to run as an executable
ENTRYPOINT ["bash"]

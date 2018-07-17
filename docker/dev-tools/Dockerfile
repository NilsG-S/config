FROM ubuntu:18.04

ENV TERM xterm-256color

# Installing dependencies
RUN apt update \
  && apt install -y \
  man \
  git \
  # This includes SCP
  openssh-server

# Login shell profile
COPY configs/.profile /root/.profile

# SSH configuration
COPY configs/ssh/ /root/.ssh/
## Restrict permissions to prevent error
RUN chmod 600 /root/.ssh/config \
  && find /root/.ssh -name "id_rsa*" -exec chmod 600 {} \;

WORKDIR /project

# Run container as an executable login shell
ENTRYPOINT ["bash", "-l"]

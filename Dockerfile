FROM ubuntu:latest

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && \
  apt-get install -y sudo \
  curl \
  git-core \
  git \
  gnupg \
  linuxbrew-wrapper \
  locales \
  nodejs \
  zsh \
  wget \
  nano \
  vim \
  npm \
  fonts-powerline \
  iputils-ping \
  python3 \
  net-tools \
  openssh-server \

# RUN apt-get -y install zsh
# RUN apt-get -y install iputils-ping
# RUN apt-get -y install python3
# RUN apt-get -y install curl wget
# RUN apt-get -y install git vim 
# RUN apt-get -y install net-tools 
# RUN apt-get -y install openssh-server
# RUN apt-get -y install cppcheck flawfinder

RUN mkdir /var/run/sshd
RUN echo 'root:1997' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir /home/hopekr
WORKDIR /home/hopekr

CMD [ "zsh" ]
EXPOSE 22

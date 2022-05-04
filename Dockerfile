FROM ubuntu:latest

CMD echo "My Ubuntu"

RUN apt-get update
RUN apt-get -y install curl wget
RUN apt-get -y install git vim 
RUN apt-get -y install net-tools locales
RUN apt-get -y install nodejs apache2

RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8 

# Create project folder in container
WORKDIR /usr/src/...

# Copy source to container
COPY ./ ./

VOLUME ["./","./"]

EXPOSE 80
EXPOSE 443

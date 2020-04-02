#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:18.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget nano acl
RUN \
  apt-get install -y git-core \
                     gnupg flex \
                     bison \
                     gperf \
                     build-essential \
                     zip \
                     curl \
                     zlib1g-dev \
                     gcc-multilib \
                     g++-multilib \
                     libc6-dev-i386 \
                     lib32ncurses5-dev \
                     x11proto-core-dev \
                     libx11-dev \
                     lib32z-dev \
                     libgl1-mesa-dev \
                     libxml2-utils \
                     xsltproc \
                     unzip \
                     git \
                     gcc \
                     curl \
                     make \
                     repo \
                     flex \
                     m4 \
                     openjdk-8-jdk \
                     lib32stdc++6 \
                     libelf-dev \
                     libssl-dev \ 
                     python-enum34 \
                     python-mako \
                     syslinux-utils && \
  rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Define default command. Because you can't get out of vi ;-)
CMD ["vi"]


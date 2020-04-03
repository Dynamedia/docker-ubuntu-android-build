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
  apt-get install -y byobu curl git htop man unzip vim wget nano acl screen
RUN \
  apt-get install -y \
    android-tools-adb \
    bc \
    bison \
    build-essential \
    flex \
    gcc \
    gcc-multilib \
    g++-multilib \
    git-lfs \
    gnupg \
    gperf \
    imagemagick \
    lzop \
    m4 \
    make \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32stdc++6 \
    lib32z-dev \
    lib32z1-dev \ 
    libc6-dev-i386 \
    libelf-dev \
    libesd-java \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \ 
    libwxgtk3.0-dev \
    libx11-dev \
    libgl1-mesa-dev \
    libxml2 \
    libxml2-utils \
    openjdk-8-jdk \
    pngcrush \
    pulsseaudio-esound-compat \
    python-enum34 \
    python-mako \
    repo \
    rsync \
    schedtool \
    squashfs-tools \
    syslinux-utils \
    unzip \
    x11proto-core-dev \
    xsltproc \
    yasm \
    zip \
    zlib1g-dev && \
  rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Define default command. Because you can't get out of vi ;-)
CMD ["vi"]


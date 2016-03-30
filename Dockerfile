# a container for neovim and assorted plugins I find usefull
#
FROM ubuntu:latest
MAINTAINER https://github.com/sthysel/nvimbox 
ENV REFRESHED_AT 2016-03-30

ENV DEBIAN_FRONTEND noninteractive

# get add-apt-repository
RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common 
# get neovim from here
RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  git \
  neovim \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN env --unset=DEBIAN_FRONTEND

RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
    update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 

RUN pip3 install neovim

CMD vim

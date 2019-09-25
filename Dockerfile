# 2. Fix docker
# fix einfügen

ARG DOCKER_BASE
FROM $DOCKER_BASE
ARG DEVICE

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq git cmake build-essential \
  libgl1-mesa-dev libsdl2-dev \
  libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev libboost-all-dev \
  libdirectfb-dev libst-dev mesa-utils xvfb x11vnc \
  libsdl-sge-dev python3-pip

RUN pip3 install "tensorflow<2.0" dm-sonnet

COPY . /gfootball
RUN cd /gfootball && pip3 install .
RUN pip3 install git+https://github.com/openai/baselines.git@master
WORKDIR '/gfootball'

FROM ubuntu:latest

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:ethereum/ethereum && \
  apt-get -y update && \
  apt-get install -y ethereum

RUN mkdir /root/blockchain
ADD genesis.json /root
WORKDIR "/root"

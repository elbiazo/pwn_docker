FROM ubuntu:18.04

RUN apt-get update

RUN apt install gdb -y
RUN apt install git -y
RUN apt install tmux -y


RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh 

ENV LANG C.UTF-8

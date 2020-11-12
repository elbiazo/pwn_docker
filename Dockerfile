# Runs ubuntu 16.04 (libc-2.23) with some tools installed
FROM ubuntu:16.04
# Install tools
RUN dpkg --add-architecture i386
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y build-essential gdb vim git ipython3 \
                                 tmux strace ltrace ruby-full \
                                 gcc-multilib libc6-dbg:i386
# Install pwndbg (old commit before they changed the heap commands)
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && \
        ./setup.sh
# Pull in ctf scripts and load pwndbg extensions
RUN git clone https://github.com/dlmarrero/ctf-utils.git ~/ctf-utils && \
        cd ~/ctf-utils/pwndbg-extensions && \
        for script in $(ls *.py); \
                do echo "source $PWD/$script" >> ~/.gdbinit; \
        done
# Install pwntools 2 and 3
#RUN pip install pwntools
RUN pip3 install pwntools
# Install one_gadget
RUN gem install one_gadget

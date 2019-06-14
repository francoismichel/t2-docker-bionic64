FROM ubuntu:12.04

RUN set -xe
RUN apt-get update 
RUN apt-get install -y binutils
RUN apt-get update 
RUN apt-get install -y python
RUN apt-get install -y python3
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y cmake
RUN apt-get install -y libgmp10 libgmp10-dev
RUN apt-get install -y build-essential
RUN apt-get install -y libz-dev libtinfo-dev 
RUN apt-get install -y clang-3.4 llvm-3.4 
#RUN wget https://releases.llvm.org/3.4/clang+llvm-3.4-x86_64-linux-gnu-ubuntu-13.10.tar.xz
#RUN tar xf clang+llvm-3.4-x86_64-linux-gnu-ubuntu-13.10.tar.xz
#RUN mkdir /usr/include/llvm
#RUN cp -r clang+llvm-3.4-x86_64-linux-gnu-ubuntu-13.10/bin/* /bin/
#RUN cp -r clang+llvm-3.4-x86_64-linux-gnu-ubuntu-13.10/lib/* /lib/
#RUN cp -r clang+llvm-3.4-x86_64-linux-gnu-ubuntu-13.10/include/* /usr/include/
RUN git clone https://github.com/hkhlaaf/llvm2kittel
RUN mkdir llvm2kittelbuild
WORKDIR llvm2kittelbuild
ENV CXX clang
RUn ln -s /usr/bin/llvm-config-3.4 /usr/bin/llvm-config
RUN cmake -DCMAKE_PREFIX_PATH=./ ../llvm2kittel/
RUN make
COPY compile_to_t2.sh /compile_to_t2.sh
RUN chmod +x /compile_to_t2.sh
RUN ls -la
ENTRYPOINT ["/compile_to_t2.sh"]
CMD [""]

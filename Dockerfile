FROM ubuntu:22.04

RUN apt update && \
    apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

RUN git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc)

WORKDIR /xmrig/build

CMD ["bash", "-c", "./xmrig -o pool.supportxmr.com:3333 -u $WALLET -p x -k"]

FROM ubuntu:22.04

# Install dependencies for XMRig and Python for Flask
RUN apt update && \
    apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Flask
RUN pip3 install flask

# Build XMRig
RUN git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc)

WORKDIR /xmrig/build

# Copy our Flask app and entry script
COPY app.py /app/app.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port for UptimeRobot
EXPOSE 8080

CMD ["/bin/bash", "/entrypoint.sh"]

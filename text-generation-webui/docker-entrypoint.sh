#!/bin/sh

cd text-generation-webui
python server.py --listen --listen-port $PORT --auto-devices --gpu-memory $GPUMEMORY --no-cache --cpu-memory $CPUMEMORY --threads $THREADS --rwkv-cuda-on

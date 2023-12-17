#!/bin/sh

cd text-generation-webui
#python jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' &
python server.py --listen --listen-port $PORT --auto-devices --gpu-memory $GPUMEMORY --no-cache --cpu-memory $CPUMEMORY --threads $THREADS --rwkv-cuda-on --monkey-patch --extensions openai alltalk_tts --model $MODEL

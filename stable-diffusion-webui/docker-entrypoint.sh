#!/bin/sh

cd stable-diffusion-webui
cp -rf packaged_models/* models/
python launch.py --listen --port $PORT

#!/bin/bash

cd stable-diffusion-webui
cp -rf packaged_models/* models/

if [[ -n "${ENABLE_INSECURE_ACCESS}" && "${ENABLE_INSECURE_ACCESS}" == "true" ]]; then
  python launch.py --listen --port $PORT --no-half-vae --enable-insecure-extension-access --xformers
else
  python launch.py --listen --port $PORT --no-half-vae --xformers
fi

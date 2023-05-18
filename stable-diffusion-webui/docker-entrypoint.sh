#!/bin/bash

cd stable-diffusion-webui
cp -rf packaged_models/* models/

if [[ -n "${ENABLE_INSECURE_ACCESS}" && "${ENABLE_INSECURE_ACCESS}" == "true" ]]; then
  python launch.py --listen --port $PORT --enable-insecure-extension-access
else
  python launch.py --listen --port $PORT
fi

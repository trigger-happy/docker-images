#!/bin/bash

cd /home/jupyter/data

# Check if .jupyterlab-rust-venv dir already exists
if [ ! -d ".jupyterlab-rust-venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv .jupyterlab-rust-venv
  source .jupyterlab-rust-venv/bin/activate
  pip install --upgrade pip
  pip install -r ../requirements.txt
  ~/.cargo/bin/evcxr_jupyter --install
fi

source .jupyterlab-rust-venv/bin/activate
jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password=''

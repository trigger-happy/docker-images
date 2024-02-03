#!/bin/bash

export PATH=$PATH:/usr/local/go/bin:/home/jupyter/go/bin
cd /home/jupyter/data

# Check if .jupyterlab-venv dir already exists
if [ ! -d ".jupyterlab-venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv .jupyterlab-venv
  source .jupyterlab-venv/bin/activate
  pip install --upgrade pip
  pip install -r ../requirements.txt
  ~/.cargo/bin/evcxr_jupyter --install

  go install github.com/janpfeifer/gonb@latest
  go install golang.org/x/tools/cmd/goimports@latest
  go install golang.org/x/tools/gopls@latest
  gonb --install
fi

source .jupyterlab-venv/bin/activate
jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password=''

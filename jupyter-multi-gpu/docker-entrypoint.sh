#!/bin/bash

export GOPATH=/home/jupyter/data/go
export PATH=$PATH:/usr/local/go/bin:/home/jupyter/data/go/bin
cd /home/jupyter/data

# Check if .jupyterlab-venv dir already exists
if [ ! -d $VENV_LOCATION ]; then
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
jupyter lab --ip='*' --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.password=$JUPYTER_PASSWORD

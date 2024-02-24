#!/bin/bash

export GOPATH=/home/jupyter/data/go
export PATH=$PATH:/usr/local/go/bin:/home/jupyter/data/go/bin
cd /home/jupyter/data

# Check if $VENV_LOCATION dir already exists
if [ ! -d $VENV_LOCATION ]; then
  echo "Creating virtual environment..."
  python3 -m venv $VENV_LOCATION --system-site-packages
  source $VENV_LOCATION/bin/activate
  pip install --upgrade pip
  pip install -r ../requirements.txt
  ~/.cargo/bin/evcxr_jupyter --install

  go install github.com/janpfeifer/gonb@latest
  go install golang.org/x/tools/cmd/goimports@latest
  go install golang.org/x/tools/gopls@latest
  gonb --install
fi

source $VENV_LOCATION/bin/activate
jupyter lab --ip='*' --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.password=$JUPYTER_PASSWORD

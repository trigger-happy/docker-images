#!/bin/bash

source /home/optillm/.venv/bin/activate

cd optillm
python3 optillm.py \
  --base-url $OPENAI_BASE_URL \
  --model $MODEL_NAME

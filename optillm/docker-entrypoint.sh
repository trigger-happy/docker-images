#!/bin/sh

source /home/optillm/.venv/bin/activate

cd optillm
python3 optillm.py \
  --base-url $OPENAI_BASE_URL \
  --model $MODEL_NAME \
  --approach $APPROACH \
  --simulations $SIMULATIONS \
  --exploration $EXPLORATION \
  --depth $DEPTH \
  --best-of-n $BEST_OF_N \
  --rstar-max-depth $RSTAR_MAX_DEPTH \
  --rstar-num-rollouts $RSTAR_NUM_ROLLOUTS \
  --rstar-c $RSTAR_C \
  --n $NUM_FINAL_RESPONSES \
  --return-full-response $RETURN_FULL_RESPONSE \
  --port $PORT \
  --optillm-api-key $OPTILLM_API_KEY

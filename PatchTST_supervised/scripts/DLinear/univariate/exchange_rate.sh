if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
model_name=DLinear

# exchange_rate, univariate results, pred_len= 24 48 96 192 336 720

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id exchange_rate_336_24 \
  --model $model_name \
  --data exchange_rate \
  --seq_len 336 \
  --pred_len 24 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_exchange_rate_336_96.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id exchange_rate_336_96 \
  --model $model_name \
  --data exchange_rate \
  --seq_len 336 \
  --pred_len 96 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_exchange_rate_336_96.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id exchange_rate_336_192 \
  --model $model_name \
  --data exchange_rate \
  --seq_len 336 \
  --pred_len 192 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_exchange_rate_336_192.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id exchange_rate_336_336 \
  --model $model_name \
  --data exchange_rate \
  --seq_len 336 \
  --pred_len 336 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.01 --feature S >logs/LongForecasting/$model_name'_'fS_exchange_rate_336_336.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id exchange_rate_336_720 \
  --model $model_name \
  --data exchange_rate \
  --seq_len 336 \
  --pred_len 720 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.01 --feature S >logs/LongForecasting/$model_name'_'fS_exchange_rate_336_720.log
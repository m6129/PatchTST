if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
model_name=Stat_models

# national_illness, univariate results, pred_len= 
python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id national_illness_336_24 \
  --model $model_name \
  --data national_illness \
  --seq_len 336 \
  --pred_len 24 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_national_illness_336_96.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id national_illness_336_36 \
  --model $model_name \
  --data national_illness \
  --seq_len 336 \
  --pred_len 36 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.001 --feature S >logs/LongForecasting/$model_name'_'fS_national_illness_336_192.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id national_illness_336_48 \
  --model $model_name \
  --data national_illness \
  --seq_len 336 \
  --pred_len 48 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.01 --feature S >logs/LongForecasting/$model_name'_'fS_national_illness_336_336.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id national_illness_336_60 \
  --model $model_name \
  --data national_illness \
  --seq_len 336 \
  --pred_len 60 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.01 --feature S >logs/LongForecasting/$model_name'_'fS_national_illness_336_720.log
import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
from neuralprophet import NeuralProphet, set_random_seed, set_log_level

class Model(nn.Module):
    """
    NeurapProphet
    """
    def __init__(self, configs):
        super(Model, self).__init__()
        self.seq_len = configs.seq_len
        self.pred_len = configs.pred_len

        m = NeuralProphet(n_forecasts=self.pred_len)
        m.fit(df=self.seq_len, metrics=['MAE','MSE'])
        
        

    def forward(self, x):
        future = m.make_future_dataframe(df=self.seq_len, n_historic_predictions=False, periods=self.pred_len)
        x = m.predict(future)
        return x # [Batch, Output length, Channel]
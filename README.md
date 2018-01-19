# Pattern Recognition #

Given brain wave and corresponding sleep stage data set,
train a MLP to predict the sleep stage of brain wave sample in test set.

The overall record of this experiment can be found in `report/report.pdf`

## Quick start  ##

Store the training file and test file to `data/train.mat` and `data/test.mat`.

In Matlab<sup>&reg;</sup>:
```matlab
>> main;
>> [acc, model, dist] = run_mlp();
>> pred = mlp_predict(model);
```
Run `main.m` to load data.

Run `run_mlp.m` to train the MLP. It will return accuracy **acc** and the predicted
results (including a trained MLP **model** and the corresponding evaluation metrics
on a 3 by 3 matrix form **dist**) on cross validation set.

Run `mlp_predict.m` to predict sleep stage of test samples using the **model**.

If want to start over:
```matlab
>> clean
>> main % run main.m script if you want to change training set and cross validation set
>> [acc, model, dist] = run_mlp(); % another round of training
>> pred = mlp_predict(model); % another round of prediction
```

### Parameters ###

By default, we use 0.05 of total training set as cross validation set to check the
performance of the model. This can be adjusted in `main.m`, line 9.

We apply training 10 times on one training set to eliminate the effort of random
initialization of net. This can be adjusted in `run_mlp.m`, line 26.

The parameters of MLP network can be adjusted in `mlp/mlp.m`, like network
size, training function, epoch limitation, etc.

Other parameters in PCA, normalization, linear scaling can be further examined
in `data_process` directory, see details in `report/report.pdf`.

+++
title = "M4 Forecasting Competition: Introducing a New Hybrid ES-RNN Model"
authors = "Slawek Smyl, Jai Ranganathan, and Andrea Pasqua"
year = 2018
+++

The Makridakis Competition is a time series forecasting competition in which the
best algorithms are pitted against one another to compare performance on
a specific time series forecasting task.

Classical results have shown that simpler algorithms tend to perform just as
well if not better than more complex algorithms. In fact, it is typical for
algorithms such as ARIMA and Exponential Smoothing (ES) to do better than
Neural Network (NN) based algorithms.

This is because Neural Networks lack an explicit notion of time, meaning that
the input needs to carefully preprocessed for NNs to be a feasible solution,
which is very difficult. Furthermore, there are too many weights to be fitted
for each time series.

This can be addressed by learning across several time series, but requires even
more careful preprocessing. Even when everything is done perfectly however,
results tend to disappoint.

---

Exponential smoothing works by following the simple formula

$\hat{y_{t+1}} = y_t + \alpha ( \hat{y_t} - y_t )$

What it is basically saying is that the current prediction is predicted as the
previous prediction adjusted by some smoothing in its error. ES has a large
number of variants that incorporate hidden state variables (unobserved
components) such as seasonality.

One of the best known variations of ES is Holt-Winters, which assumes a linear
trend component. In principle, there is no reason for this trend to be linear.
Through differentiable programming, one can model the trend non-linearly via
a Neural Network for example.

## The author's approach

### Preprocessing

- input and output windows are constant size
- output window is as large as the prediction horizon
- input window size is based on experimentation and rule of thumb, should at
  least equal seasonality.
- Normalization is done locally rather than across the entire series. The time
  series values within the windows are divided by some locally stable number
  that nevertheless changes throughout the series.
  - the author uses level
- NNs struggle with seasonality.
  - it is better to deaseasonalize the data beforehand
    - with something like STL (Seasonal and Trend decomposition using Loess)
  - however it is even better to just not use NNs and use an algorithm that
    deals with deseasonalization internally, like ES.

### The Model

- The model merges Holt-Winters Exponential Smoothing with an RNN modelling the
  local trend.

$\hat{y}_{t+1 \dots t+h} = RNN(X_t) * l_t * s_{t+1 \dots t+h}$

- The RNN is global and trained on all series
- The other parameters are series-specific.
- This means that the computational graph is different for each series
  - So need for a dynamic computational graph NN system.
- The RNN model consisted in blocks of dilated LSTMs optionally connected
  with ResNet-style connections.

### Training

- metrics used for point forecasts were
  - L1 difference
  - Symmetric Mean Absolute Percent Error (sMAPE)
  - Mean Absolute Squared Error (MASE)
- Since the model appeared to have a positive bias, the author opted for
  a pinball loss function that features a non-symmetric penalty.
- metric used for prediction intervals was Mean Scaled Interval Score (MSIS).

## Other Notes

- Machine Learning models are well equipped for knowledge transfer from denser
  to sparser time series, so are a good option for sparse time series
  forecasting.
- The model described featured pure time series forecasting. Adding other
  regressors (weather, geographical attributes, etc. may enrich the model,
  improving performance.
- Time series problems that require domain knowledge would be well suited for
  hybrid models (Differentiable Programming) such as the one described
- Uber aiming to release this model as part of Pyro forecasting library.

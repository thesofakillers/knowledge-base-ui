+++
title = "Forecasting at Uber: An Introduction"
authors = "Franziska Bell, Slawek Smyl"
year = 2018
+++

- Forecasting approaches can be grouped in 3 categories:
  - _model-based/causal classical_
    - strongest approach when the underlying mechanism/physics is well known.
  - _statistical_
    - good idea to apply when the underlying mechanism is too complicated or
      not known
    - examples include: ARIMA, Holt-Winters and Theta.
  - _machine learning based_
    - examples include RNNs and Quantile Regression Forests (QRF)
    - can be exploited when there is a lot of data.
    - when interpretability is not important, can be used no problem.

## Comparing Methods

- Need to employ backtesting: train on data that is older than testing data.
- two main approaches
  - sliding window approach: the model is trained on a fixed size sliding window of
    data, followed by a fixed size sliding window for testing
  - expanding window approach: the model is trained on more and more data, and
    tested on a fixed size window appended at the end of the training set.
    - useful for when the amount of data is limited
  - ![](https://1fykyq3mdn5r21tpna3wkdyi-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/image6-e1536165830511-1068x283.png)
- Sometimes one may marry the methods, starting with expanding window until
  a threshold size is reached at which sliding window is started.
- Evaluation metrics to consider
  - Comparison against naive forecast (next value is equal to previous value, or
    previous seasonal value)

## Uncertainty Estimation

- Prediction intervals need to also be estimated
- These are the upper and lower forecast values that define a span under which
  the prediction is likely to fall in within some (typically high) probability,
  typically 0.9 or 0.95.
- prediction intervals are just as important as the point forecast itself.

+++
title = "Machine Learning for Precipitation Nowcasting from Radar Images"
authors = "Agrawal et al"
year = 2019
+++

- Need to process large amounts of data at _low latency_. This spec is well
  suited for machine learning, while traditional approaches fail to recognize
  the initiation and decay of a storm or take too much time to produce their
  output
- The paper tackles the problem of predicting the instantaneous rate of
  precipitation one hour into the future from Doppler radar data.
  - 3 binary classifications regarding whether rate exceeds thresholds
    corresponding to:
    - trace rain
    - light rain
    - moderate rain
  - Dimensionality
    - high resolution: 1km x 1km
    - short-term: 1 hr
  - The authors treat forecasting as an image-to-image translation problem, leveraging U-Net CNN.
    - given sequence of radar images starting from t*{in1} and ending at
      t*{inN} the authors are tasked to generate the radar image at some point in
      the future t\_{out}.

## Data Setup

- System provides precipitation rates every 2 minutes.
- Use the MRMS (???) dataset:
  - Non-meteorological artefacts are removed
  - observations from each radar station is combined onto a rectangular grid.
- Three types of data transformation
  1. Precipitation rate is quantized into 4 ranges corresponding to three
     thresholds mentioned above
  2. Partition the US into 256km x 256km tiles, since it is too large to model
     all at once
  3. Oversample rainy tiles such that 80% of tiles have at least one pixel of
     rain.
- Trained on data collected in 2018
- Tested on two half-years of data from 2017 and 2018.

## Evaluation and Results

- evaluation reduces to binary classification problem of the three different
  thresholds, using precision and recall (PR) metric.
- Compare to:
  - MRMS persistence: predicted to be raining in the next hour at the same rate
    it is currently raining
    - surprisingly difficult to outperform.
  - Optical Flow: model the velocity of objects moving through the set of
    images
  - HRRR: forecasts various atmospheric variables on a grid numerically.
- The model outperforms all 3 alternatives in PR metric.

## Future Work

- add more types and modalities of input data to provide more information and
  breadth to the solution
- perform hyperparameter optimization or simply investigate utilizing
  a different NN architecture such as GANs.
- address issue of borders of images not being accounted for

## Appendices

### A - Related Deep Learning Work

- work in precipitation nowcasting can be split into two categories
  - those who model time explicitly using RNNs
  - those who rely on image-to-image translations via convolution

### B - Problem Formulation

- Ideally, one would estimate the probability distribution of rain quantities
  for each pixel using Bayesian methods.
  - these are however unfeasible for large quantities of data
- Alternatively, one could perform regression to estimate the instantaneous
  rate of rain at each pixel.
  - However this quantity would have little value as the same instatneous rate
    could be the result of various phenomena, hence containing little
    predictive information.
- As such, authors settled on probability distribution of ranges of
  precipitation rate.

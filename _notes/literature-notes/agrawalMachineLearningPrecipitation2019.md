+++
title = "Machine Learning for Precipitation Nowcasting from Radar Images"
authors = "Agrawal et al"
year = 2019
+++

- Need to process large amounts of data at _low latency_. This spec is well
  suited for machine learning, while traditional approaches tend to rely on:
  - _Optical Flow_ (???): attempt to identify movement of objects through a scene,
    although fails to recognize the initiation and decay of a storm.
  - _Numerical Methods_: directly simulate the underlying atmospheric physics,
    but typically take too much time to produce their output
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
- The authors treat forecasting as an image-to-image translation problem,
  leveraging U-Net CNN.
  - given sequence of radar images starting from t*{in1} and ending at
    t*{inN} the authors are tasked to generate the radar image at some
    point in the future t\_{out}.
- Horizontal Atmospheric Advection (???) is the primary driver for changes in the
  radar images.

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

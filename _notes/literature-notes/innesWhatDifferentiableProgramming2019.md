+++
title = "What Is Differentiable Programming?"
authors = "Mark Innes"
year = 2019
+++

Differentiable Programming is a form of Machine Learning that takes an opposing
approach to Deep Learning; instead of increasingly deep models, it aims to
optimize the problem structure. 

An example of Differentiable Programming would be utilizing convolution in
image classification rather than a classic perceptron, since convolutional
layers have been shown to re-use image kernels, hence optimizing the problem
structure.

The fact of the matter is that we can apply the techniques of deep learning to
_any_ parametrised, differentiable function $f(x)$, i.e. not only matrix
multiplication. 

This is because differential equations are basically equivalent to neural
networks, only that they have much more stringent constraints.

This means that any technique dealing with differential equations can be used
in harmony. We _can_ incorporate physics engines inside deep learning models.
This is particularly helpful in reinforcement learning. We may refer to these
models as _hybrid models_.

+++
title = "The Basics of Hypothesis Tests and Their Interpretations"
authors = "Daniel Goldman"
year = 2018
+++

Before diving into hypothesis testing, it is useful to revisit the mathematical
concept of _proof by contradiction_:

- have candidate statement, which we want to show to be false.
- we assume this statement to be true.
- seek for a contradiction of the statement.
  - if we demonstrate a contradiction, we prove that the statement is indeed
    false
  - otherwise, we fail to prove anything.

Hypothesis testing is similar, but unlike a method for proofs, it is _not
absolute_

- We have a null hypothesis, which we want to reject.
- We assume this hypothesis to be true.
- We make a number of observations, estimating the probability of observing
  what we observe, and assuming that whatever we observe is not extraordinary.
  - if what we observe has a low probability of happening under our
    assumptions, then either it is rare, or our assumptions (hypothesis) is
    false, and we must reject them.
  - otherwise, we fail to reject anything. But we certainly do not accept the
    null hypothesis. The null hypothesis is just a tool for producing
    a "proof" by contradiction.

## Alternative Hypotheses

- Rejecting the null hypothesis does not necessarily mean accepting the
  alternative hypothesis.
- This is because the null hypothesis also assumes an underlying distribution,
  which is assumed in the alternative hypothesis too.
- As such, rejecting the null hypothesis either means that indeed there is
  something unusual that warrants an acceptance of a new (alternative
  hypothesis) _or_ that the original distribution which we chose was actually
  wrong.

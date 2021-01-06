
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ecocom

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/alaindanet/ecocom.svg?branch=master)](https://travis-ci.com/alaindanet/ecocom)
[![R build
status](https://github.com/alaindanet/ecocom/workflows/R-CMD-check/badge.svg)](https://github.com/alaindanet/ecocom/actions)
<!-- badges: end -->

The goal of ecocom is to provide tools to compute plant-plant
interactions and moments of trait distribution.

## Installation

You can install the development version of ecocom from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("alaindanet/ecocom")
```

## Example

This is a basic example which shows you how to solve a common problem:

### Compute moments of a trait distribution

``` r
library(ecocom)
## basic example code

#vector of species abundance
abun <- rpois(n = 10, lambda = 3)
# vector of species trait
trait <- rnorm(n = 10, mean = 10, sd = 3)

# Compute the moments of trait distribution
calc_cw_moments(trait = trait, weight = abun)
#>       mean   variance   skewness   kurtosis 
#> 10.6483773 23.0843062  0.0672937  2.9857581
```

### Compute plant-plant interaction index

The `n_int_a` and `n_int_c` compute the neighbor-effect respectively
with additive and commutative symmetry according to [Diaz-Sierra et al.
(2016)](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.12706).

``` r
n_int_a(without = 0, with_nbs = 1)
#> [1] 2
```

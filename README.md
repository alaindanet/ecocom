
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
#> 10.3806957  6.5003318  0.5312293  1.8120433
```

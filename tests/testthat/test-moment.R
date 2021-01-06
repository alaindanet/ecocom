set.seed(123)

normal <- rnorm(n= 2000, mean = 0, sd = 1)
test_that("normal works", {
  out <- calc_cw_moments(trait = normal, weight = rep(1, length(normal)) / length(normal))
  out <- round(out)

  expect_equal(out, c(mean = 0, variance = 1, skewness = 0, kurtosis = 3))
})

uniform <- runif(n= 2000, min = 0, max = 1)
test_that("uniform works", {
  out <- calc_cw_moments(trait = uniform, weight = rep(1, length(uniform)) / length(uniform))
  out <- round(out, 1)

  expect_equal(out[c("mean", "skewness", "kurtosis")], c(mean = 0.5, skewness = 0, kurtosis = 1.8))
})

expo <- rexp(n = 2000, rate = .1) 
test_that("exponential works", {
  out <- calc_cw_moments(trait = expo, weight = rep(1, length(expo)) / length(expo))
  out <- round(out)

  expectation <- c(mean = mean(expo), variance = var(expo),
    skewness = moments::skewness(expo), kurtosis = moments::kurtosis(expo)) 
  expectation <- round(expectation)

  expect_equal(out, expectation)
})


#trait <- seq(1,3)
#fq_eq <- rep(1, 3) %>% {. / sum(.)}
#fq_uneq <- c(1, 3, 1) %>% {. / sum(.)}
#calc_cw_moments(trait = trait, weight = fq_eq)
#calc_cw_moments(trait = trait, weight = fq_uneq)
#out <- round(out)

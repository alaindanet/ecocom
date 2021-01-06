#' Calculate moments of trait distribution
#' 
#' @param trait numeric vector of trait values
#' @param cw_mean output from calc_cw_mean
#' @param cw_variance output from calc_cw_variance
#' @inheritParams scale_weight
#' @return a numeric vector
#' @export
#' @examples
#' #vector of species abundance
#' abun <- rpois(n = 10, lambda = 3)
#' # vector of species trait
#' trait <- rnorm(n = 10, mean = 10, sd = 3)
#' 
#' calc_cw_moments(trait = trait, weight = abun)
calc_cw_mean <- function (trait = NULL, weight = NULL) {
  sum(trait * scale_weight(weight))
}

#' @rdname calc_cw_mean
#' @export
calc_cw_variance <- function (trait = NULL, weight = NULL, cw_mean = NULL) {

  weight <- scale_weight(weight)

  if (is.null(cw_mean)) {
    cw_mean <- calc_cw_mean(trait = trait, weight = weight) 
  }

  sum(weight * (trait - cw_mean)^2)
}

#' @rdname calc_cw_mean
#' @export
calc_cw_skewness <- function (trait = NULL, weight = NULL, cw_mean = NULL, cw_variance = NULL) {

  weight <- scale_weight(weight)

  if (is.null(cw_mean)) {
    cw_mean <- calc_cw_mean(trait = trait, weight = weight) 
  }
  if (is.null(cw_variance)) {
    cw_variance <- calc_cw_variance(trait = trait, weight = weight, cw_mean = cw_mean)
  }

  sum((weight * (trait - cw_mean)^3) / cw_variance^(3/2))
}

#' @rdname calc_cw_mean
#' @export
calc_cw_kurtosis <- function (trait = NULL, weight = NULL, cw_mean = NULL, cw_variance = NULL) {

  weight <- scale_weight(weight)

  if (is.null(cw_mean)) {
    cw_mean <- calc_cw_mean(trait = trait, weight = weight) 
  }
  if (is.null(cw_variance)) {
    cw_variance <- calc_cw_variance(trait = trait, weight = weight, cw_mean = cw_mean)
  }

  sum((weight * (trait - cw_mean)^4) / cw_variance^2)
}

#' @rdname calc_cw_mean
#' @export
calc_cw_moments <- function (trait = NULL, weight = NULL) {

  weight <- scale_weight(weight)

  output <- vector(mode = "numeric", length = 4)
  names(output) <- c("mean", "variance", "skewness", "kurtosis")

  output["mean"] <- calc_cw_mean(trait = trait, weight = weight)

  output["variance"] <- calc_cw_variance(trait = trait, weight = weight,
    cw_mean = output["mean"])

  output["skewness"] <- calc_cw_skewness(trait = trait, weight = weight,
    cw_mean = output["mean"], cw_variance = output["variance"])

  output["kurtosis"] <- calc_cw_kurtosis(trait = trait, weight = weight,
    cw_mean = output["mean"], cw_variance = output["variance"])

  output

}

#' Scale weight 
#'
#' Divide weights by their sum 
#'
#' @param weight numeric vector of relative abundance or biomass 
#' @export
#' @examples
#' abun <- rpois(n = 10, lambda = 3)
#' scaled <- scale_weight(abun)
#' c(base = sum(abun), scaled = scaled)
scale_weight <- function (weight = NULL) {

  weight / sum(weight)
} 

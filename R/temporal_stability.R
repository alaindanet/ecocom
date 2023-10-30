################################################################################
#                        Functions to compute synchrony                        #
################################################################################

compute_sp_nb_from_com_mat <- function (com_mat = NULL) {

  rowSums(com_mat != 0)

}

compute_avg_cv_sp <- function(biomass, variance) {
  #Check that the species are in the same order in the vector:
  stopifnot(names(biomass) == names(variance))

  rel_biomass <- biomass / sum(biomass)
  rel_sdt <- sqrt(variance) / biomass

  cv_avg <- sum(rel_biomass * rel_sdt)
  return(cv_avg)
}

compute_cv_com <- function(synchrony, cv_sp) {
  sqrt(synchrony) * cv_sp
}


compute_synchrony <- function(cov_mat) {
  com_var <- sum(cov_mat)
  var_intra_sp <- sum(sqrt(diag(cov_mat)))
  phi <- com_var / (var_intra_sp^2)
  return(phi)
}

#' Community stability decomposition
#'
#' @param mat a time x species matrix containing abundances, or biomasses,
#' etc...
#'
#' @details Add the paper references
#'
#' @export
community_stability <- function(mat) {

  bm_sp <- colMeans(mat)
  bm_tot <- sum(bm_sp)

  cov_mat <- cov(mat)
  var_tot <- sum(cov_mat)

  bm_tot / sqrt(var_tot)
}

#' @rdname community_stability
#' @export
statistical_averaging_effect <- function(mat) {

  var_sp <- apply(mat, 2, var)
  sd_sp <- apply(mat, 2, sd)

  statistical_averaging <- sum(sd_sp) / sqrt(sum(var_sp))
  statistical_averaging_even <- sqrt(ncol(mat))
  eveness <- statistical_averaging / statistical_averaging_even

  c(
    total = statistical_averaging,
    even = statistical_averaging_even,
    eveness = eveness
  )
}

#' @rdname community_stability
#' @export
compensatory_effect <- function(mat) {
  cov_mat <- cov(mat)
  var_sp <- diag(cov_mat)
  var_tot <- sum(cov_mat)
  sqrt(sum(var_sp)) / sqrt(var_tot)
}

#' @rdname community_stability
#' @export
asynchrony <- function(mat) {

  cov_mat <- cov(mat)
  var_sp <- diag(cov_mat)
  var_tot <- sum(cov_mat)

  sum(sqrt(var_sp)) / sqrt(var_tot)
}

#' @rdname community_stability
#' @export
population_stability <- function(mat) {

  bm_sp <- colMeans(mat)
  bm_tot <- sum(bm_sp)

  sd_sp <- apply(mat, 2, sd)

  bm_tot / sum(sd_sp)
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plant_plant_interactions.R
\name{n_int_a}
\alias{n_int_a}
\title{Additive Intensity Neighbor Index}
\usage{
n_int_a(without, with_nbs)
}
\arguments{
\item{without}{a vector containing non-negatives real values.}

\item{with_nbs}{a vector containing non-negatives real values. 

with_nbs contains the performance of individuals with a neighbor.
without contains the performance of individual without a neighbor.}
}
\value{
a vector containing the index values.
}
\description{
Additive Intensity Neighbor Index
}
\details{
This function computes the Additive Intensity Neighbor Index developed by
Dìaz-Sierra et al. (2016). Positive values indicates a positive net effect of
the neighbor (facilitation) whereas negative values indicates a negative one
(competition).
}
\examples{
n_int_a(without = 1, with_nbs = 4)
n_int_a(without = 0.4, with_nbs = 0.1)

}
\seealso{
n_int_c
}

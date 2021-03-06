% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/n_groups.R
\name{n_groups}
\alias{n_groups}
\alias{n_groups.default}
\alias{n_groups.incidence}
\title{count number of groups}
\usage{
n_groups(x, ...)

\method{n_groups}{default}(x, ...)

\method{n_groups}{incidence}(x, ...)
}
\arguments{
\item{x}{an \code{\link[=incidence]{incidence()}} object.}

\item{...}{unused}
}
\value{
an integer indicating the number of groups present in the incidence
object.
}
\description{
count number of groups
}
\examples{
i <- incidence(dates = sample(10, 100, replace = TRUE), 
               interval = 1L,
               groups = sample(letters[1:2], 100, replace = TRUE))
n_groups(i)
}
\keyword{accessors}

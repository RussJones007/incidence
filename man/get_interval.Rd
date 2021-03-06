% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_interval.R
\name{get_interval}
\alias{get_interval}
\alias{get_interval.incidence}
\title{Get the interval for an incidence object.}
\usage{
get_interval(x, ...)

\method{get_interval}{incidence}(x, integer = TRUE, ...)
}
\arguments{
\item{x}{an \link{incidence} object.}

\item{...}{Unused}

\item{integer}{When \code{TRUE} (default), the interval will be converted to an
integer vector if it is stored as a character in the incidence object.}
}
\value{
if \code{integer = TRUE}: an integer vector, otherwise: the value stored
in \code{x$interval}
}
\description{
Get the interval for an incidence object.
}
\examples{

set.seed(999)
dat <- as.Date(Sys.Date()) + sample(-3:50, 100, replace = TRUE)
x <- incidence(dat, interval = "month")
get_interval(x)
get_interval(x, integer = FALSE)
}
\keyword{accessors}

\name{onesamp}
\alias{onesamp}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{ Paired Sample t-test }
\description{
This function performs a t-test for the mean difference for paired data,
and produces a scatterplot of one column against the other column, showing 
whether there was any benefit to using the paired design.
}
\usage{
onesamp(dset=corn, x="unsprayed", y="sprayed", xlab=NULL, ylab=NULL, dubious=NULL, conv=NULL, dig=2)
}
\arguments{
  \item{dset}{a matrix or dataframe having two columns}
  \item{x}{ name of column to play the role of the `predictor' }
  \item{y}{ name of column to play the role of the `response' }
  \item{xlab}{ horizontal axis label }
  \item{ylab}{ vertical axis label }
  \item{dubious}{ }
  \item{conv}{ }
  \item{dig}{ }
}
\value{

A scatterplot of \code{y} against \code{x} together with estimates
of standard errors and standard errors of the difference 
(\code{y}-\code{x}).

Also produced is a confidence interval and p-value for the test.

}
\author{J.H. Maindonald}

\examples{
onesamp(dset = pair65, x = "ambient", y = "heated", xlab =
        "Amount of stretch (ambient)", ylab =
        "Amount of stretch (heated)") 
}
\keyword{models}

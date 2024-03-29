\name{CVbinary}
\alias{CVbinary}
\title{Cross-Validation for Regression with a Binary Response}
\description{
This function gives internal and cross-validation measures of predictive
accuracy for regression with a binary response.  The data are 
randomly assigned to a number of `folds'.  
Each fold is removed, in turn, while the remaining data is used
to re-fit the regression model and to predict at the deleted observations.
}
\usage{
CVbinary(obj=frogs.glm, rand=NULL, nfolds=10, print.details=TRUE)
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{obj}{ a \code{glm} object}
  \item{rand}{ a vector which assigns each observation to a fold }
  \item{nfolds}{ the number of folds}
  \item{print.details}{ logical variable (TRUE = print detailed output, 
the default) }
}
\value{
  \item{the order in which folds were deleted}
  \item{internal estimate of accuracy}
  \item{cross-validation estimate of accuracy}
}
\author{J.H. Maindonald}

\seealso{ \code{glm} }

\examples{
frogs.glm <- glm(pres.abs ~ log(distance) + log(NoOfPools), 
   family=binomial,data=frogs)
CVbinary(frogs.glm)
mifem.glm <- glm(outcome ~ ., family=binomial, data=mifem)
CVbinary(mifem.glm)
}
\keyword{models}

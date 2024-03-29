\name{socsupport}
\alias{socsupport}
\title{Social Support Data}
\usage{socsupport}
\description{
Data from a survey on social and other kinds of support.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{gender}{a factor with levels
\code{female}, \code{male} }
    \item{age}{age, in years, with levels
    \code{18-20}, \code{21-24}, \code{25-30}, 
 \code{31-40},\code{40+} }
    \item{country}{a factor with levels \code{australia}, 
\code{other} }
    \item{marital}{a factor with levels \code{married},
\code{other}, \code{single} }
    \item{livewith}{a factor with levels \code{alone}, 
\code{friends}, \code{other}, \code{parents}, 
\code{partner}, \code{residences}}
    \item{employment}{a factor with levels
\code{employed fulltime}, \code{employed part-time}, 
\code{govt assistance}, \code{other}, \code{parental support}} 
    \item{firstyr}{a factor with levels \code{first year}, 
\code{other} }
    \item{enrolment}{a factor with levels
\code{}, \code{full-time}, \code{part-time}}
    \item{emotional}{summary of 5 questions on emotional support availability}
    \item{emotionalsat}{summary of 5 questions on emotional support satisfaction}
    \item{tangible}{summary of 4 questions on availability of tangible support}
    \item{tangiblesat}{summary of 4 questions on satisfaction with tangible support}
    \item{affect}{summary of 3 questions on availability of affectionate support sources}
    \item{affectsat}{summary of 3 questions on satisfaction with affectionate support sources}
    \item{psi}{summary of 3 questions on availability of positive social interaction}
    \item{psisat}{summary of 3 questions on satisfaction with positive social 
interaction}
    \item{esupport}{summary of 4 questions on extent of emotional support sources}
    \item{psupport}{summary of 4 questions on extent of practical support sources}
    \item{supsources}{summary of 4 questions on extent of social support 
sources (formerly, socsupport)}
    \item{BDI}{Score on the Beck depression index (summary of 21 questions)}
  }
}
\source{
Melissa Manning, Psychology, Australian National University
}
\examples{
attach(socsupport)

not.na <- apply(socsupport[,9:19], 1, function(x)!any(is.na(x)))
ss.pr1 <- princomp(as.matrix(socsupport[not.na, 9:19]), cor=TRUE)  
pairs(ss.pr1$scores[,1:3])
sort(-ss.pr1$scores[,1])        # Minus the largest value appears first
pause()

not.na[36] <- FALSE
ss.pr <- princomp(as.matrix(socsupport[not.na, 9:19]), cor=TRUE)  
summary(ss.pr)          # Examine the contribution of the components
pause()

# We now regress BDI on the first six principal components:
ss.lm <- lm(BDI[not.na] ~ ss.pr$scores[, 1:6], data=socsupport)
summary(ss.lm)$coef
pause()

ss.pr$loadings[,1]
plot(BDI[not.na] ~  ss.pr$scores[ ,1], col=as.numeric(gender), 
pch=as.numeric(gender),  xlab ="1st principal component", ylab="BDI")
topleft <- par()$usr[c(1,4)]
legend(topleft[1], topleft[2], col=1:2, pch=1:2, legend=levels(gender))
}
\keyword{datasets}

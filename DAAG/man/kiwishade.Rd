\name{kiwishade}
\alias{kiwishade}
\title{Kiwi Shading Data}
\usage{kiwishade}
\description{
The \code{kiwishade} data frame has 48 rows and 4 columns.
The data are from a designed experiment that  
compared different kiwifruit shading treatments.
There are four vines in each plot, and four plots (one for each of four 
treatments: none, Aug2Dec, Dec2Feb, and Feb2May) in each of three blocks
(locations: west, north, east). Each 
plot has the same number of vines, each block has the same number of 
plots, with each treatment occurring the same number of times.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{yield}{Total yield (in kg)}
    \item{plot}{a factor with levels    \code{east.Aug2Dec},
    \code{east.Dec2Feb},    \code{east.Feb2May},
    \code{east.none},    \code{north.Aug2Dec},
    \code{north.Dec2Feb},    \code{north.Feb2May},
    \code{north.none},    \code{west.Aug2Dec},
    \code{west.Dec2Feb},    \code{west.Feb2May},
    \code{west.none} }
    \item{block}{a factor indicating the location of the plot with levels
\code{east}, \code{north}, \code{west} }
\item{shade}{a factor representing the period for which
the experimenter placed shading over the vines; with levels:
    \code{none} no shading,    \code{Aug2Dec} August - December,
    \code{Dec2Feb} December - February,    \code{Feb2May} February - May}
}
}
\details{
The northernmost plots were grouped together because they
were similarly affected by shading from the sun in the north.
For the remaining two blocks shelter effects, whether from the
west or from the east, were thought more important.
}

\source{
Snelgar, W.P., Manson. P.J., Martin, P.J. 1992. Influence of
time of shading on flowering and yield of kiwifruit vines. Journal of
Horticultural Science 67: 481-487.
}
\references{
 Maindonald J H 1992. Statistical design, analysis and presentation
issues. New Zealand Journal of Agricultural Research 35: 121-141.
}
\examples{
print("Data Summary - Example 2.2.1")
attach(kiwishade)
kiwimeans <- aggregate(yield, by=list(block, shade), mean)
names(kiwimeans) <- c("block","shade","meanyield")

kiwimeans[1:4,]
pause()
 
print("Multilevel Design - Example 9.3")
kiwishade.aov <- aov(yield ~ shade+Error(block/shade),data=kiwishade)
summary(kiwishade.aov)
pause()


sapply(split(yield, shade), mean)

pause()

kiwi.table <- t(sapply(split(yield, plot), as.vector))
kiwi.means <- sapply(split(yield, plot), mean)
kiwi.means.table <- matrix(rep(kiwi.means,4), nrow=12, ncol=4)   
kiwi.summary <- data.frame(kiwi.means, kiwi.table-kiwi.means.table)   
names(kiwi.summary)<- c("Mean", "Vine 1", "Vine 2", "Vine 3", "Vine 4")
kiwi.summary
mean(kiwi.means) # the grand mean (only for balanced design)

require(nlme)
kiwishade.lme <- lme(fixed = yield ~ shade, random = ~ 1 | block/plot, 
data=kiwishade)
res <- residuals(kiwishade.lme)
hat <- fitted(kiwishade.lme) # By default fitted(kiwishade.lme, level=2)
coplot(res ~ hat | kiwishade$block, pch=16, columns=3,
  xlab= "Fitted", ylab="Residuals")
 
res <- residuals(kiwishade.lme)
hat <- fitted(kiwishade.lme, level=0) # shade effects only
unique(hat) # There are just four distinct values, one per treatment
coplot(res ~ hat | kiwishade$block, pch=16, columns=3,
  xlab="Fitted", ylab="Residuals")

n.omit <- 2
take <- rep(TRUE, 48)
take[sample(1:48,2)] <- FALSE
kiwishade.lme <- lme(yield ~ shade, data = kiwishade,
                     random = ~1 | block/plot, subset=take)
VarCorr(kiwishade.lme)[4, 1]  # Plot component of variance
VarCorr(kiwishade.lme)[4, 1]  # Vine component of variance

detach(kiwishade)


}
\keyword{datasets}

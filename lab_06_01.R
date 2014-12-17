cat("\014") 
library(bootstrap)
xdata=law
perc05 <- function(x) 
{
  quantile(x, .05)
}
n=15
law_corr=cor(xdata)
law_corr


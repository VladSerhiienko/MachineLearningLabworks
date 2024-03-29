`bestsetNoise` <-
function (m = 100, n = 40, method="exhaustive", nvmax=3) 
{
  leaps.out <- try(require(leaps), silent = TRUE)
  if ((is.logical(leaps.out) == TRUE) & (leaps.out == TRUE)) {
    y <- rnorm(m)
    xx <- matrix(rnorm(m * n), ncol = n)
    dimnames(xx) <- list(NULL, paste("V", 1:n, sep = ""))
    u <- regsubsets(xx, y, method = method, nvmax = nvmax, 
                    nbest = 1)
    x <- xx[, summary(u)$which[nvmax, -1]]
    u1 <- lm(y ~ x)
    print(summary(u1, corr = FALSE))
    invisible(u1)
  }
  else {
    print("Error: package leaps is not installed properly")
  }
}


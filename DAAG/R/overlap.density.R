"overlap.density" <-
function (x0, x1, ratio = c(0.05, 20), 
          compare.numbers=TRUE, plotit = TRUE,
  gpnames= c("Control", "Treatment"),
  xlab="Score")
{
    d0 <- density(x0)
    d1 <- density(x1)
if(compare.numbers){
    n0 <- length(x0)
    n1 <- length(x1)
    f0 <- d0$y * n0
    f1 <- d1$y * n1
    ylab <- "Density x total frequency"
} else
{
f0<-d0$y
f1<-d1$y
ylab <- "Density"
}
    xlim <- range(c(d0$x, d1$x), na.rm = TRUE)
    ylim <- range(c(0, f0, f1))
    ylim[2] <- ylim[2] + 0.1 * diff(ylim)
    if (plotit) {
        plot(d1$x, f1, xlim = xlim, xlab = xlab, xaxt = "n", 
            yaxs = "i", ylim = ylim, ylab = ylab, 
            main = "", col = 2, type = "l", lty = 1, lwd = 2, 
            bty = "n")
axis(1)
box(bty="L")
        lines(d0$x, f0, lwd = 2, lty = 2)
        xpos <- par()$usr[1]
        ypos <- par()$usr[4]
        legend(xpos, ypos, lty = c(2, 1), col = c("black", "red"), 
            cex = c(0.8, 0.8), legend = gpnames, 
            lwd = c(1, 2), bty = "n")
    }
if(is.null(ratio))return()
    d0 <- density(x0, from = xlim[1], to = xlim[2])
    d1 <- density(x1, from = xlim[1], to = xlim[2])
    x01 <- d0$x
if(compare.numbers){
    f0 <- d0$y * n0
    f1 <- d1$y * n1
}
    f0[f0 < 0] <- 0
    f1[f1 < 0] <- 0
    fmin <- pmin(f0, f1)
    fmax <- max(fmin)
    subs <- match(fmax, fmin)
    xmid <- x01[subs]
    flow <- ratio[1]
    fhi <- ratio[2]
    lochoose <- x01 < xmid & (f0 <= flow * f1 | f1 <= f0 * flow)
    if (any(lochoose)) 
        xlim[1] <- max(x01[lochoose])
    else xlim[1] <- min(x01)
    hichoose <- x01 > xmid & (f0 >= fhi * f1 | f1 >= f0 * fhi)
    if (any(hichoose)) 
        xlim[2] <- min(x01[hichoose])
    else xlim[2] <- max(x01)
    if (plotit) 
        axis(1, at = xlim, labels = paste(signif(xlim, 4)), las = 2)
    xlim
}


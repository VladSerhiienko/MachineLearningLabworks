cat("\014") 
data=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_02\alligators.txt",header=TRUE)
data
x=c(data[1,1]);
y=c(data[1,2]);
for (i in 2:25)
{
  x=c(x,data[i,1]);
  y=c(y,data[i,2]);
}
fit1<-lm(y~x+I(x^2))
fit1

r=c(fit1[[1]])
y1=r[1]+r[2]*x+r[3]*x^2
xy=data.frame(x=x,y=y)
fit2<-nls(y~b*x^3,start=list(b=1))
fit2

y2=0.0001703*(x^3)
fit3=nls(y~a/x^-2,start=list(a=1))
fit3

y3=0.0178/(x^-2)
plot (xy, type = "n", main = "Line's Regression")
lines (x, y1, "o")
lines (x, y2, "b")
lines (x, y,  "p")
lines (x, y3, "l")
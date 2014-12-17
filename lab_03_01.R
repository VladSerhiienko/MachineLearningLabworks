cat("\014") 
data=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_03\reglab2.txt",header=TRUE)
data
y=c(data[1,1]);
x1=c(data[1,2]);
x2=c(data[1,3]);
x3=c(data[1,4]);
x4=c(data[1,5]);
for (i in 2:200)
{
  y=c(y,data[i,1]);
  x1=c(x1,data[i,2]);
  x2=c(x2,data[i,3]);
  x3=c(x3,data[i,4]);
  x4=c(x4,data[i,5]);
}
fit1 <- lm(y ~ poly((x1+x2+x3+x4), 2))
fit1

fit2 <- lm(y ~ (x1+x2+x3+x4) + I((x1+x2+x3+x4)^2))
fit2

fit3 <- lm(y ~ (x1+x2+x3+x4))
fit3

fit4 <- lm(y ~ (x1+x2+x3+x4)^2)
fit4
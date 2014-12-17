cat("\014") 
mas<-rnorm(7983,1,0.50)
sumamas<-sum(mas)
MatemSpod=sumamas/7983
MatemSpod

Szn=mean(mas)
Dys=mean(mas^2)-mean(mas)^2
Dys

OcDys=var(mas)
OcDys

kvantel=quantile(mas,c(0.95,0.99))
kvantel

nmas=matrix(c(1000,2000,4000,8000),nrow=1)
Msp1=matrix(1:4, nrow=1)
Msp2=matrix(1:4, nrow=1)
Ds1=matrix(1:4,nrow=1)
Ds2=matrix(1:4,nrow=1)
for(i in 1:length(nmas)){
   x=rnorm(nmas[1,i],1,0.5)
   suma=sum(x)
   Msp1[1,i]=mean(x)
   Msp2[1,i]=suma/nmas[1,i]
   Ds1[1,i]=var(x)
   Ds2[1,i]=mean(x^2)-mean(x)^2
}
Msp1
Msp2
Ds1
Ds2
cat("\014") 
N=15
Number=c(1:N)
Name=c("A","B","C", "D", "E", "F",
"G", "H", "I", "J", "K",
"L", "M", "N", "O")
Birth=seq(1960,1990,len=N)
Empl=seq((Birth[1]+18),2010,len=N)
Salary=matrix(1:15,nrow=N)
for(i in 1:N){
    if (Birth[i]<1970){
       Salary[i]=(log(2011-Empl[i])+1)*800
    }
    else {
       Salary[i]=(log(2011-Empl[i])+1)/log(2)*810
    } 
}
p=data.frame(Number,Name,Birth,Empl,Salary)
count=0
for(i in 1:N){
  if(Salary[i]>1500) {
       count=count+1
  }
}
Stavka=matrix(1:15,nrow=N)
Suma=matrix(1:15,nrow=N)
for (i in 1:N){
  if((2011-Empl[i])<5)
  {
       Stavka[i]=Salary[i]*0.13
  }else {
       Stavka[i]=Salary[i]*0.2
  }
  Suma[i]=Salary[i]+Stavka[i] 
}
p=data.frame(p,Stavka, Suma)
p
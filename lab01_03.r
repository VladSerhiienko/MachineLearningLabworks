cat("\014") 
kil=500
x=seq(1,10,len=kil)
y=dexp(x)
plot(x,y)
min_max=function(x)
{  mas=matrix(1:2,nrow=1)
   mas[1]=min(x)
   mas[2]=max(x)
   return (mas)
}
myfun=function(x,arg2)
{	minimym=min_max(x)
  newx=seq(minimym[1],minimym[2],len=arg2/10)
  xs=seq(minimym[1],minimym[2],len=arg2/10)
  newy=seq(minimym[1],minimym[2],len=arg2/10)
  for (i in 1:(length(newx)-1))
  {	
    newy[i]=0
    for(j in 1:length(x))
    {	
      if ((x[j]>newx[i])&&(x[j]<newx[i+1]))
      {	
        newy[i]=newy[i]+1
      }		
    }
    xs[i]=(newx[i]+newx[i+1])/2 	
  }
  newy[arg2/10]=2
  plot(xs,newy/arg2)
  p=data.frame(xs,newy)
  return (p)
} 
m_m=min_max(y)
m_m
m=myfun(y,kil)
m
cat("\014") 
k=6
x=c(2+k,3+k,4+k,5+k)
x
y=c(7+k,5+k,8+k,7+k)
y
Polinom2=function(x1,y1,n)
{
  a1=((sum(x1*y1)/n)-(sum(x1)/n)*(sum(y1)/n))/((sum(x1^2)/n)-(sum(x1)/n)^2)
  a0=(sum(y1)/n)-a1*(sum(x1)/n)
  s=c(a1,a0)
  return (s)
}
lin=Polinom2(x,y,k)
lin

Polinom4=function(x1,y1,n)
{
  xx4=sum(x1^4)
  xx3=sum(x1^3)
  xx2=sum(x1^2)
  x2y=sum(x1^2*y1)
  xx1=sum(x1)
  xy=sum(x1*y1)
  yy=sum(y1)
  d=xx4*xx2*n+xx1*xx3*xx2+xx1*xx3*xx2-xx2^3-xx1^2*xx4-xx3^2*n
  d1=x2y*xx2*n+xx1*xy*xx2+xx1*xx3*yy-yy*xx2^2-xx1^2*x2y-n*xx3*xy
  d2=xx4*xy*n+yy*xx3*xx2+xx1*x2y*xx2-xx2^2*xy-yy*xx1*xx4-xx3*x2y*n
  d3=xx4*xx2*yy+xx1*xx3*x2y+xy*xx3*xx2-xx2^2*x2y-xy*xx1*xx4-xx3^2*yy
  a=d1/d
  b=d2/d
  c=d3/d
  s=c(a,b,c)
  return (s)
}
kv=Polinom4(x,y,k)
kv

y2=lin[1]*x+lin[2]
y3=kv[1]*x^2+kv[2]*x+kv[3]
plot (x, y, type = "n", main = "Aproximation")
colors = c("blue","red","black")
lines (x, y, type="b",  col = colors[1])
lines (x, y2, type="o",  col = colors[2])
lines (x, y3, type="l",   col = colors[3])
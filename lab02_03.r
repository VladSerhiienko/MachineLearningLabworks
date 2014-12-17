cat("\014") 
read=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_02\allcountries.txt",header=TRUE)
names(read)=c("Num","Country","Population","Area","GDP","Index")
count=0;
l1=c(read[1,3]);
l2=c(read[1,4]);
k = 0;
for (i in 2:222)
{
  read[i,3]
  if((read[i,4]>10000)&&(read[i,4]!=0))
  {	
    k=k+1;
    l1=c(l1,read[i,3]);
    l2=c(l2,read[i,4]);
  }	
}
count
l1
l2
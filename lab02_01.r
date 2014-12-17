cat("\014") 
dani=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_02\iris.txt",header=TRUE)
dani 
x1=c(dani [1,1]);
x2=c(dani [1,2]);
x3=c(dani [1,3]);
x4=c(dani [1,4]);
for (i in 2:150)
{  x1=c(x1, dani [i,1]);
   x2=c(x2, dani [i,2]);
   x3=c(x3, dani [i,3]);
   x4=c(x4, dani [i,4]);
}	x1
x2
x3
x4
set.seed(0)
shapiro.test(x1)
Shapiro-Wilk normality test
dani:  x1
W = 0.9761, p-value = 0.01018
//Гіпотеза відкидається, p-value < α
set.seed(0)
shapiro.test(x2)
Shapiro-Wilk normality test
dani:  x2
W = 0.9849, p-value = 0.1012
//Гіпотеза повинна бути прийнята, p-value > α
set.seed(0)
shapiro.test(x3)
Shapiro-Wilk normality test
dani:  x3
W = 0.8763, p-value = 7.412e-10
//Гіпотеза відкидається, p-value < α
set.seed(0)
shapiro.test(x4)
Shapiro-Wilk normality test
dani:  x4
W = 0.9018, p-value = 1.68e-08
//Гіпотеза відкидається - p-value <α
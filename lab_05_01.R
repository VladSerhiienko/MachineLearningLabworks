cat("\014") 
data=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_05\svmdata3.txt",header=TRUE)
x=subset(data,select=-Colors)
library(e1071)
model1=svm(data$Colors~.,data,kernel="polynomial",degree=5,gamma=0.35)
model1

plot(model1,data)

Color_pred=predict(model1,x)

table(data$Colors,Color_pred)

table(data$Colors,Color_pred)

model2=svm(data$Colors~.,data,kernel="radial",gamma=0.6)
model2

table(data$Colors,Color_pred)

plot(model2,data)

Color_pred=predict(model2,x)
table(data$Colors,Color_pred)
model3=svm(data$Colors~.,data,kernel="sigmoid",gamma=0.8)
model3

Color_pred=predict(model3,x)
table(data$Colors,Color_pred)
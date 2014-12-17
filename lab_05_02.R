cat("\014") 
data=read.table("С:\Program Files\LAB_YEAR_5\MZKN\Lab_05\svmdata3.txt",header=TRUE)
x=subset(data,select=-Colors)
chooseCRANmirror()
library(e1071)
model11=svm(data$Colors~.,data,kernel="polynomial",degree=3,gamma=0.35)
model11

plot(model11,data)
Color_pred=predict(model11,x)
Color_pred

green red

green

table(data$Colors,Color_pred)
Color_pred

model12=svm(data$Colors~.,data,kernel="polynomial",degree=5,gamma=0.35)
model12

lot(model12,data)
plot(model12,data)
Color_pred=predict(model12,x)
table(data$Colors,Color_pred)

model13=svm(data$Colors~.,data,kernel="polynomial",degree=8,gamma=0.35)
model13

plot(model13,data)
Color_pred=predict(model12,x)
table(data$Colors,Color_pred)

Color_pred=predict(model13,x)
table(data$Colors,Color_pred)

model14=svm(data$Colors~.,data,kernel="polynomial",degree=8,gamma=0.5)
model14

Color_pred=predict(model14,x)
table(data$Colors,Color_pred)

plot(model14data)
plot(model14,data)

model21=svm(data$Colors~.,data,kernel="radial",gamma=0.4)
model21
plot(model21,data)
Color_pred=predict(model21,x)
table(data$Colors,Color_pred)

model22=svm(data$Colors~.,data,kernel="radial",gamma=0.6)
model22

Color_pred=predict(model22,x)
table(data$Colors,Color_pred)

plot(model22,data)
model23=svm(data$Colors~.,data,kernel="radial",gamma=0.8)
model23

table(data$Colors,Color_pred)

Color_pred=predict(model23,x)
table(data$Colors,Color_pred)

plot(model23,data)
model31=svm(data$Colors~.,data,kernel="sigmoid",gamma=0.8)
model31

Color_pred=predict(model31,x)
table(data$Colors,Color_pred)

plot(model31,data)
model32=svm(data$Colors~.,data,kernel="sigmoid",gamma=0.6)
model32

Color_pred=predict(model32,x)
table(data$Colors,Color_pred)

plot(model32,data)
model33=svm(data$Colors~.,data,kernel="sigmoid",gamma=0.4)
model33

Color_pred=predict(model33,x)
table(data$Colors,Color_pred)

plot(model33,data)
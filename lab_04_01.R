cat("\014") 
#install.packages("DAAG")
#install.packages("/home/taras/Документи/LAB_YEAR_5/MZKN_Pukach/Lab_04/DAAG")
№install.packages("С:\tmp\Rtmpw4a5lU\downloaded_packages")


fil=monica
der=tree(outcome~.,fil)
der

summary(der)

plot(der,type="uniform")
text(der)

derevce=snip.tree(der,nodes=4)
derevce
draw.tree(derevce)

derevce2 <- prune.tree(der, k = 4)
derevce2

draw.tree(derevce2)
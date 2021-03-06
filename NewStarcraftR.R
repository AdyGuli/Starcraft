rm(list=ls(all=T))
setwd("C:\\Users\\adyg\\Downloads")
starcraft=read.csv("starcraft.csv", h=T)
names(starcraft)
attach(starcraft)
starcraft <- starcraft[,-c(1)]
starcraft1=starcraft[LeagueIndex==1,]
starcraft2=starcraft[LeagueIndex==2,]
starcraft3=starcraft[LeagueIndex==3,]
starcraft4=starcraft[LeagueIndex==4,]
starcraft5=starcraft[LeagueIndex==5,]
starcraft6=starcraft[LeagueIndex==6,]
starcraft7=starcraft[LeagueIndex==7,]
starcraft8=starcraft[LeagueIndex==8,]

starcraft1 <- starcraft1[,-c(1)]
starcraft2 <- starcraft2[,-c(1)]
starcraft3 <- starcraft3[,-c(1)]
starcraft4 <- starcraft4[,-c(1)]
starcraft5 <- starcraft5[,-c(1)]
starcraft6 <- starcraft6[,-c(1)]
starcraft7 <- starcraft7[,-c(1)]
starcraft8 <- starcraft8[,-c(1)]

fullmodel1=lm(APM~., data=starcraft1)
fullmodel2=lm(APM~., data=starcraft2)
fullmodel3=lm(APM~., data=starcraft3)
fullmodel4=lm(APM~., data=starcraft4)
fullmodel5=lm(APM~., data=starcraft5)
fullmodel6=lm(APM~., data=starcraft6)
fullmodel7=lm(APM~., data=starcraft7)
fullmodel8=lm(APM~., data=starcraft8)

install.packages("alr3")
library("alr3")
#step model 8
train.1=lm(APM~1,data = starcraft8)
StepwiseAic8=step(train.1, 
                  scope = formula(fullmodel8), direction = "both")

pureErrorAnova(StepwiseAic8)
summary(StepwiseAic8)

#step model 7 
train.1=lm(APM~1,data = starcraft7)
StepwiseAic7=step(train.1, 
                  scope = formula(fullmodel7), direction = "both")
pureErrorAnova(train.StepwiseAic7)
summary(StepwiseAic7)

#step model 6 
train.1=lm(APM~1,data = starcraft6)
StepwiseAic6=step(train.1, 
                  scope = formula(fullmodel6), direction = "both")
pureErrorAnova(StepwiseAic6)
summary(StepwiseAic6)

#step model 5
train.1=lm(APM~1,data = starcraft5)
StepwiseAic5=step(train.1, 
                  scope = formula(fullmodel5), direction = "both")
pureErrorAnova(StepwiseAic5)
summary(StepwiseAic5)

#step model 4
train.1=lm(APM~1,data = starcraft4)
StepwiseAic4=step(train.1, 
                  scope = formula(fullmodel4), direction = "both")
pureErrorAnova(StepwiseAic4)
summary(StepwiseAic4)

#step model 3
train.1=lm(APM~1,data = starcraft3)
StepwiseAic3=step(train.1, 
                  scope = formula(fullmodel3), direction = "both")

pureErrorAnova(StepwiseAic3)
summary(StepwiseAic3)

#step model 2
train.1=lm(APM~1,data = starcraft2)
StepwiseAic2=step(train.1, 
                  scope = formula(fullmodel2), direction = "both")

pureErrorAnova(StepwiseAic2)
summary(StepwiseAic2)

#step model 1 
train.1=lm(APM~1,data = starcraft1)
StepwiseAic1=step(train.1, 
                  scope = formula(fullmodel1), direction = "both")


pureErrorAnova(StepwiseAic1)
summary(StepwiseAic1)

#End of step models 

par(mfrow=c(2,2))
plot(StepwiseAic1, main = "Diagnostic Residual Plots for LeagueIndex 1")
plot(StepwiseAic2, main = "Diagnostic Residual Plots for LeagueIndex 2")
plot(StepwiseAic3, main = "Diagnostic Residual Plots for LeagueIndex 3")
plot(StepwiseAic4, main = "Diagnostic Residual Plots for LeagueIndex 4")
plot(StepwiseAic5, main = "Diagnostic Residual Plots for LeagueIndex 5")
plot(StepwiseAic6, main = "Diagnostic Residual Plots for LeagueIndex 6")
plot(StepwiseAic7, main = "Diagnostic Residual Plots for LeagueIndex 7")
plot(StepwiseAic8, main = "Diagnostic Residual Plots for LeagueIndex 8")

install.packages("lmtest")
install.packages("nortest")
library("lmtest")
library("nortest")

dwtest(StepwiseAic1)
ad.test(StepwiseAic1$residuals)

dwtest(StepwiseAic2)
ad.test(StepwiseAic2$residuals)

dwtest(StepwiseAic3)
ad.test(StepwiseAic3$residuals)

dwtest(StepwiseAic4)
ad.test(StepwiseAic4$residuals)

dwtest(StepwiseAic5)
ad.test(StepwiseAic5$residuals)

dwtest(StepwiseAic6)
ad.test(StepwiseAic6$residuals)

dwtest(StepwiseAic7)
ad.test(StepwiseAic7$residuals)

dwtest(StepwiseAic8)
ad.test(StepwiseAic8$residuals)




View(starcraft8)
model8<-lm(starcraft8$APM~.,data=starcraft8)
summary(model8)

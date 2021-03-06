#graphs

#house price index reidin
pdf(file = "Dropbox/research/tex/figs/reidin.pdf")
plot(y = df$house, x = df$date, type="l", xlab = "months", ylab = "house price index",
     ann = 1, col="blue")
dev.off()

#stock price index bist30
pdf(file = "Dropbox/research/tex/figs/bist.pdf")
plot(y = df$stock, x = df$date, type="l", xlab = "months", ylab = "stock price index",
     ann = 1, col="red")
dev.off()

#wage series by age
pdf(file = "Dropbox/research/tex/figs/wage2median.pdf")
plot(w2)
dev.off()

#WAGE BY SEC AND YEAR
pdf(file = "Dropbox/research/tex/figs/wage2sec.pdf")
tmpcol <- c("springgreen4","green1","blue","plum1","blueviolet","orange","grey","red1","steelblue")
tmpindex <- c("1","6","7","8","9","10","11","12","14")
for(i in 1:9){
  tmpsec <- subset(aktug, aktug$sector==tmpindex[i])
  tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
  if(i==1){
    plot(tmpsec, type="l", ylim=c(0,median(aktug$income)*4), col=tmpcol[i])
  }else{
    lines(tmpsec, type="l", col=tmpcol[i])
  }
}
legend(x="topleft", y=0,legend = seclist, fill = tmpcol, lty = c(1,1), cex = 1)
dev.off()

#WAGE BY EDUC AND AGE
pdf(file = "Dropbox/research/tex/figs/wage2educ.pdf")
tmpindex <- c("1","2","3","5","7","8","9","10","11")
tmpcol <- c("springgreen4", "green1", "blue", "plum1", "violet", "orange", "grey", "red1", "steelblue")
for(i in 1:9){
  tmpsec <- subset(aktug, aktug$educ==tmpindex[i])
  tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$age))[c("age","income")]
  if(i==1){
    plot(tmpsec, type="l", ylim=c(0,max(aktug$income)/10), col=tmpcol[i])
  }else{
    lines(tmpsec, type="l", col=tmpcol[i])
  }
}
legend(x="topleft", y=0,legend = educlist, fill = tmpcol, lty = c(1,1))
dev.off()

#WAGE BY EDUC AND YEAR
pdf(file = "Dropbox/research/tex/figs/wage3educ.pdf")
tmpcol <- c("springgreen4", "green1", "blue", "plum1", "violet", "orange", "grey", "red1", "steelblue")
tmpindex <- c("1","2","3","5","7","8","9","10","11")
for(i in 1:9){
  tmpsec <- subset(aktug, aktug$educ==tmpindex[i])
  tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
  if(i==1){
    plot(tmpsec, type="l", ylim=c(0,median(aktug$income)*5), col=tmpcol[i])
  }else{
    lines(tmpsec, type="l", col=tmpcol[i])
  }
}
legend(x="topleft", y=0,legend = educlist, fill = tmpcol, lty = c(1,1))
dev.off()

#ak1 <- subset(aktug, aktug$educ>7 & aktug$educ<11)
#w3 <- aggregate(x=ak1, FUN=mean, by=list(ak1$age))[c("age","income")]
#plot(w3, type="l")

#ak1 <- subset(aktug, aktug$sector==9)
#w3 <- aggregate(x=ak1, FUN=mean, by=list(ak1$year))[c("year","income")]
#lines(w3, type="l")



# FINCAPITAL INVESTMENT DEFAULTS

pdf(file = "~/Dropbox/research/mathesis/tex/figs/defaults.pdf")
plot(age, stoage, ylim = c(0.2,1), xlim = c(param_Y,param_R), type="l", col="red", ylab = "stock share")
lines(age, bodie, type="l", col="orange")
lines(age, markowitz, type="l", col="green")
lines(age, ah0, type="l", col="purple")
legend(x = "topright", y=0, legend = c("(100-t)%", "Cocco et al.", "Markowitz", "Anadolu Hayat"), fill = c("red", "orange", "green", "purple"))
dev.off()

# FINCAPITAL MERTON

# FINCAPITAL MUNK NO HOUSING

# FINCAPTIAL MUNK HOUSING





# WAGE EDUC JUST THREE
pdf(file = "~/Dropbox/research/mathesis/tex/figs/wage2educ.pdf")

tmpsec <- subset(aktug, aktug$educ==2)
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$age))[c("age","income")]
tmpsec <- subset(tmpsec, tmpsec$age >= 26 & tmpsec$age <= 67)
plot(tmpsec$age, tmpsec$income, type="l", ylim=c(0, 220), col="green", xlab="age", ylab="real wage")

tmpsec <- subset(aktug, aktug$educ==7)
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$age))[c("age","income")]
tmpsec <- subset(tmpsec, tmpsec$age >= 25 & tmpsec$age <= 67)
lines(tmpsec$age, tmpsec$income, col="blue")

tmpsec <- subset(aktug, aktug$educ==10)
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$age))[c("age","income")]
tmpsec <- subset(tmpsec, tmpsec$age >= 25 & tmpsec$age <= 67)
lines(tmpsec$age, tmpsec$income, col="red")
  
legend(x="topleft", y=0,legend = c("undergraduate", "high school", "no schooling"), fill = c("red", "blue", "green"), lty = c(1,1), cex=1.5)
dev.off()




pdf(file = "~/Dropbox/research/mathesis/tex/figs/wage2sec.pdf")

tmpsec <- subset(aktug, aktug$sector=="1")
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
plot(tmpsec$year, tmpsec$income, type="l", ylim=c(30,200), col="red", ylab="real wage", xlab="year")

tmpsec <- subset(aktug, aktug$sector=="6")
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
lines(tmpsec$year, tmpsec$income, type="l", col="orange")

tmpsec <- subset(aktug, aktug$sector=="9")
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
lines(tmpsec$year, tmpsec$income, type="l", col="blue")

tmpsec <- subset(aktug, aktug$sector=="12")
for(satir in 1:nrow(tmpsec)){tmpsec$income[satir] <- tmpsec$income[satir]/cpiann$V2[tmpsec$year[satir]-2002]}
tmpsec <- aggregate(x=tmpsec, FUN=median, by=list(tmpsec$year))[c("year","income")]
lines(tmpsec$year, tmpsec$income, type="l", col="green")

legend(x="topleft", y=0,legend = c("finance", "education", "trade", "agriculture"), fill = c("blue", "green", "orange", "red"), lty = c(1,1), cex = 1.5)

dev.off()









pdf(file="~/Dropbox/research/mathesis/tex/figs/humancapital.pdf")
plot(c(25:64), L_steep, type="l", xlab="age", ylab="human capital", ylim=c(50, 3300),col="red3")
lines(c(25:64), L_moderate, col="orange2")
lines(c(25:64), L_flat, col="green3")
legend(x = "topright", y =0, legend = c("steep","moderate","flat"), fill=c("red3","orange2","green3"), cex=1.4)
dev.off()



pdf(file = "Dropbox/research/mathesis/tex/figs/heterwageless.pdf")
plot(LL_steep, type="l", col="red", xlab = "age", ylab = "wage", ylim = c(50,200))
lines(LL_moderate, type="l", col="orange")
lines(LL_flat, type="l", col="green")
legend(x="topleft", y=0,legend = c("steep", "moderate", "flat"), fill = c("red", "orange", "green"), lty = c(1,1), cex = 1.5)
dev.off()



# 
# pdf("~/Dropbox/research/mathesis/tex/figs/individuals10.pdf")
# plot(0, type="n", ylim=c(0,1), xlim=c(25,63), ylab="fin capital", xlab="age")
# for(i in 1:27){
#   ltype<-2;if(i%%3==2){ltype<-1}
#   coltype1<-"gray";if(i%%3==2){coltype1<-"red"}
#   coltype2<-"gray";if(i%%3==2){coltype2<-"blue"}
#   lines(c(25:63), latmnk[1:39,i], lty=ltype, col=coltype1)
#   lines(c(25:63), latbod[1:39,i], lty=ltype, col=coltype2)
# }
# legend(x = "bottomleft", y=0, legend = c("Bodie et al.", "Munk"), fill=c("blue", "red3"), cex=1.5)
# dev.off()


#pdf("~/Dropbox/research/mathesis/tex/figs/hmunkhouse10.pdf")
# plot(0, type="n", ylim=c(0,1), xlim=c(25,63), ylab="fin capital", xlab="age")
# for(i in 1:27){
#   ltype<-3;if(i%%3==2){ltype<-1}
#   coltype1<-"gray";if(i%%3==2){coltype1<-"red"}
#   lines(c(25:63), latmnkh[1:39,i], lty=ltype, col=coltype1)
# }
#dev.off()

#pdf("~/Dropbox/research/mathesis/tex/figs/smunkhouse10.pdf")
# plot(0, type="n", ylim=c(0,1), xlim=c(25,63), ylab="fin capital", xlab="age")
# for(i in 1:27){
#   ltype<-3;if(i%%3==2){ltype<-1}
#   coltype1<-"gray";if(i%%3==2){coltype1<-"blue"}
#   lines(c(25:63), latmnks[1:39,i], lty=lt
#pdf(file="~/Dropbox/research/mathesis/tex/figs/reidindiff.pdf")
plot(df$date[-1], drealhouse[-1], type="l", col='green3', xlab="months", ylab="real housing returns")
#dev.off()

plot(drealstock, type='l', col='blue')
lines(drealhouse, type='l', col='red')
lines(drealwage, type='l', col='green')ype, col=coltype1)
# }
#dev.off()


#pdf(file="~/Dropbox/research/mathesis/tex/figs/bistdiff.pdf")
plot(df$date[-1], drealstock[-1], type="l", col='red3', xlab="months", ylab="real stock returns")
#dev.off()


#pdf(file="~/Dropbox/research/mathesis/tex/figs/wagediff.pdf")
plot(df$date[-1], drealwage[-1], type="l", col='blue3', xlab="months", ylab="real wage growth")
#dev.off()



#pdf(file = "~/Dropbox/research/mathesis/tex/figs/heterwage.pdf")
plot(Ftmpeduc$income, ylim=c(30,200), col="green", xlab="age", ylab="real wages")
lines(rep(Ftmpeduc[1,2],40))
points(Mtmpeduc$income, col="blue")
lines(cumprod(c(Mtmpeduc[1,2],Mxx$fitted.values + 1)))
points(Stmpeduc$income, col="red")
lines(cumprod(c(Stmpeduc[1,2],Sxx$fitted.values + 1)))
legend(x="topleft", y=0,legend = c("steep", "moderate", "high"), fill = c("red", "blue", "green"), lty = c(1,1), cex=1.5)
#dev.off()




#pdf(file = "Dropbox/research/mathesis/tex/figs/heterwage.pdf")
# plot(Stmpeduc, type="l", col="red")
# lines(Mtmpeduc, type="l", col="red")
# lines(Ftmpeduc, type="l", col="red")
# lines(param_mu_w_steep, type="l", col="blue")
# lines(param_mu_w_moderate, type="l", col="blue")
# lines(param_mu_w_flat, type="l", col="blue")
# legend(x="topleft", y=0,legend = c("actual", "parameterized"), fill = c("red", "blue"), lty = c(1,1), cex = 1.5)
#dev.off()


#pdf(file = "Dropbox/research/tex/figs/heterwageless.pdf")
plot(param_mu_w_steep, type="l", col="red", xlab = "age", ylab = "wage")
lines(param_mu_w_moderate, type="l", col="orange")
lines(param_mu_w_flat, type="l", col="green")
legend(x="topleft", y=0,legend = c("steep", "moderate", "flat"), fill = c("red", "orange", "green"), lty = c(1,1), cex = 1.5)
#dev.off()

#pdf(file = "Dropbox/research/tex/figs/survival.pdf")
plot(surv, xlab = "age", ylab = "survival probability")
#dev.off()


# plot(density(mcmnk3[,1]),ylim=c(0,0.009),col='red')
# lines(density(mcmrk3[,1]),col='green')
# lines(density(mcmnkh3[,1]),col='blue')
# lines(density(mcbnk3[,1]),col='grey')
# lines(density(mcbod3[,1]),col='orange')
# lines(density(mccoc3[,1]),col='black')
# lines(density(mcsto3[,1]),col='purple')


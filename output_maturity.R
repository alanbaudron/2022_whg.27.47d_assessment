## combined area

rezboot<-read.csv("data\\A50CI_Weight_year2.csv",h=T, sep=",")

# plot A50 combined

png('output\\mat_ogive.png',  width=2600, height=2000, res=400)

with(rezboot,plot(year,A50,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(0,2),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,pos=0,at=seq(1990,fyear,1),labels=seq(1990,fyear,1))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.92,at=seq(0,2,0.2),labels=seq(0,1,0.1))
mtext("Age at 50% Maturity", side=2, line=3,cex.lab=2,las=3)
polygon(c(rezboot$year, rev(rezboot$year)), c(rezboot$upr, rev(rezboot$lwr)),col = "grey", border = NA)
with(rezboot,points(year,A50,type="l",lwd=2,col="red"))

dev.off()

## plot proportion mature at age 1, 2

data<-read.table("data\\ogives.year.whgt2.csv",h=T, sep=",")

data1<-subset(data,age==1)
data2<-subset(data,age==2)

png('output\\mat_age.png',  width=2600, height=2000, res=400)
with(data,plot(year,mat,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(0,2),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,pos=-0.04,at=seq(1990,fyear,1),labels=seq(1990,fyear,1), mgp=c(3, .9, 0))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.92,at=seq(0,1,0.1),labels=seq(0,1,0.1), mgp=c(3, .9, 0))
mtext("Proportion mature", side=2, line=3,cex.lab=2,las=3)
polygon(c(data1$year, rev(data1$year)), c(data1$upr, rev(data1$lwr)),col =adjustcolor("red",alpha.f=0.2), border = NA)
with(data1,points(year,mat,type="l",lwd=2,col="red"))

polygon(c(data2$year, rev(data2$year)), c(data2$upr, rev(data2$lwr)),col =adjustcolor("green",alpha.f=0.2), border = NA)
with(data2,points(year,mat,type="l",lwd=2,col="darkgreen"))

text(c(fyear-1), 0.65, "Age 2",cex = 1.2,col="darkgreen")
text(c(fyear-1), 0.20, "Age 1",cex = 1.2,col="red")
dev.off()

# plot A50 N,S, combined
data<-read.table("data\\A50CI_Weight_year2.csv",sep=",",h=T)
data_area<-read.table("data\\A50CI_yearAREA.csv",sep=",", h=T)

data1<-data
data1_areaN<-data_area[data_area$area=="NORTH",]
data1_areaS<-data_area[data_area$area=="SOUTH",]

png('output\\mat_A50_compare.png',  width=2600, height=2000, res=400)

with(data1,plot(year,A50,type="n",lwd=2,xlim=c(1991,fyear),ylim=c(0,3),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,at=seq(1990,fyear,1),labels=seq(1990,fyear,1), mgp=c(3, .9, 0))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,at=seq(0,3,0.1),labels=seq(0,3,0.1), mgp=c(3, .9, 0))
mtext("Age at 50% maturity", side=2, line=3,cex.lab=2,las=3)

#polygon(c(data1$year, rev(data1$year)), c(data1$upr, rev(data1$lwr)),col =adjustcolor("darkgrey",alpha.f=0.2), border = NA)
with(data1,points(year,A50,type="l",lwd=2,col="black"))

polygon(c(data1_areaN$year, rev(data1_areaN$year)), c(data1_areaN$upr, rev(data1_areaN$lwr)),col =adjustcolor("purple",alpha.f=0.2), border = NA)
with(data1_areaN,points(year,A50,type="l",lwd=2,col="purple"))

polygon(c(data1_areaS$year, rev(data1_areaS$year)), c(data1_areaS$upr, rev(data1_areaS$lwr)),col =adjustcolor("orange",alpha.f=0.2), border = NA)
with(data1_areaS,points(year,A50,type="l",lwd=2,col="orange"))

legend("topright", c("NORTH", "SOUTH", "combined"), lty = 1.5,bty="n", col =c("purple","orange","black"))

dev.off()

# by area North

rezboot<-read.table("data\\A50CI_Weight_year2_NORTH.csv",h=T, sep=",")

png('output\\mat_ogive_north.png',  width=2600, height=2000, res=400)

with(rezboot,plot(year,A50,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(1,2),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,pos=0.96,at=seq(1990,fyear,1),labels=seq(1990,fyear,1))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.92,at=seq(1,2,0.1),labels=seq(1,2,0.1))
mtext("Age at 50% Maturity", side=2, line=3,cex.lab=2,las=3)
polygon(c(rezboot$year, rev(rezboot$year)), c(rezboot$upr, rev(rezboot$lwr)),col = "grey", border = NA)
with(rezboot,points(year,A50,type="l",lwd=2,col="red"))

dev.off()

rezboot<-read.table("data\\A50CI_Weight_year2_SOUTH.csv",h=T, sep=",")

png('output\\mat_ogive_south.png',  width=2600, height=2000, res=400)

with(rezboot,plot(year,A50,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(0,3),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,at=seq(1990,fyear,1),labels=seq(1990,fyear,1))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.8,at=seq(0,3,0.1),labels=seq(0,3,0.1))
mtext("Age at 50% Maturity", side=2, line=3,cex.lab=2,las=3)
polygon(c(rezboot$year, rev(rezboot$year)), c(rezboot$upr, rev(rezboot$lwr)),col = "grey", border = NA)
with(rezboot,points(year,A50,type="l",lwd=2,col="red"))

dev.off()

data<-read.table("data\\ogives.year.whgt2_NORTH.csv",sep=",",h=T)

data1<-subset(data,age==1)
data2<-subset(data,age==2)

png('output\\mat_age_north.png',  width=2600, height=2000, res=400)
with(data,plot(year,mat,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(0,1),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,pos=-0.04,at=seq(1990,fyear,1),labels=seq(1990,fyear,1), mgp=c(3, .9, 0))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.92,at=seq(0,1,0.1),labels=seq(0,1,0.1), mgp=c(3, .9, 0))
mtext("Proportion mature", side=2, line=3,cex.lab=2,las=3)
polygon(c(data1$year, rev(data1$year)), c(data1$upr, rev(data1$lwr)),col =adjustcolor("red",alpha.f=0.2), border = NA)
with(data1,points(year,mat,type="l",lwd=2,col="red"))

polygon(c(data2$year, rev(data2$year)), c(data2$upr, rev(data2$lwr)),col =adjustcolor("green",alpha.f=0.2), border = NA)
with(data2,points(year,mat,type="l",lwd=2,col="darkgreen"))

text(c(fyear-1), 0.65, "Age 2",cex = 1.2,col="darkgreen")
text(c(fyear-1), 0.20, "Age 1",cex = 1.2,col="red")
dev.off()


data<-read.table("data\\ogives.year.whgt2_SOUTH.csv",sep=",",h=T)

data1<-subset(data,age==1)
data2<-subset(data,age==2)

png('output\\mat_age_south.png',  width=2600, height=2000, res=400)
with(data,plot(year,mat,type="n",lwd=2,xlim=c(1990,fyear),ylim=c(0,1),xaxt="n",yaxt="n",xlab="",ylab=""))
axis(1,pos=-0.04,at=seq(1990,fyear,1),labels=seq(1990,fyear,1), mgp=c(3, .9, 0))
mtext("Year", side=1, line=3, cex.lab=2)
axis(2,pos=1988.92,at=seq(0,1,0.1),labels=seq(0,1,0.1), mgp=c(3, .9, 0))
mtext("Proportion mature", side=2, line=3,cex.lab=2,las=3)
polygon(c(data1$year, rev(data1$year)), c(data1$upr, rev(data1$lwr)),col =adjustcolor("red",alpha.f=0.2), border = NA)
with(data1,points(year,mat,type="l",lwd=2,col="red"))

polygon(c(data2$year, rev(data2$year)), c(data2$upr, rev(data2$lwr)),col =adjustcolor("green",alpha.f=0.2), border = NA)
with(data2,points(year,mat,type="l",lwd=2,col="darkgreen"))

text(c(fyear-1), 0.65, "Age 2",cex = 1.2,col="darkgreen")
text(c(fyear-1), 0.20, "Age 1",cex = 1.2,col="red")
dev.off()


matog<-read.table("data\\smoothed_matogive_plusg8.csv",sep=",", h=T)
Mat0<-read.table("data\\ogives.year.whgt2.csv", sep=",", h=T) 
Mat0<-subset(Mat0, year<=fyear & year>1990) 
Mat0<-Mat0[,c(1,2,3)]

png("output\\smoothed_matogive.png",  width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(Mat0[Mat0$age==1,"year"], Mat0[Mat0$age==1,"mat"], col="red", ylim=c(0,1.2), pch=20, xlab="Year", ylab="Proportion mature", bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
points(Mat0[Mat0$age==2,"year"], Mat0[Mat0$age==2,"mat"], col="green", pch=20)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
points(Mat0[Mat0$age==3,"year"], Mat0[Mat0$age==3,"mat"], col="blue", pch=20)
lines(matog$Year, matog$Age3, col="blue")
points(Mat0[Mat0$age==4,"year"], Mat0[Mat0$age==4,"mat"], col="cyan", pch=20, lwd=1.6)
lines(matog$Year, matog$Age4, col="cyan")
points(Mat0[Mat0$age==5,"year"], Mat0[Mat0$age==5,"mat"], col="black", pch=20, lwd=1.6)
lines(matog$Year, matog$Age5, col="black")
points(Mat0[Mat0$age==6,"year"], Mat0[Mat0$age==6,"mat"] ,col="lightgrey", pch=20, lwd=1.6)
lines(matog$Year, matog$Age6, col="lightgrey")
points(Mat0[Mat0$age==7,"year"], Mat0[Mat0$age==7,"mat"], col="grey", pch=1, lwd=1.6)
lines(matog$Year, matog$Age7, col="grey")
points(Mat0[Mat0$age==8,"year"], Mat0[Mat0$age==8,"mat"], col="darkgrey", pch=17, lwd=1.6)
lines(matog$Year, matog$Age8, col="darkgrey")

legend("bottomright", legend=c("1","2","3","4","5","6","7","8"),  col=c("red","green","blue","cyan","black","light grey","grey", "dark grey"),lwd=1.6, bty="n",ncol=2 )

dev.off()

png("output\\smoothed_matogive_plusg.png",  width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(Mat0[Mat0$age==1,"year"], Mat0[Mat0$age==1,"mat"], col="transparent", ylim=c(0,1.2), xlab="Year", ylab="Proportion mature", bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
lines(matog$Year, matog$Age3, col="blue")
lines(matog$Year, matog$Age4, col="cyan")
lines(matog$Year, matog$Age5, col="black")
lines(matog$Year, matog$Age6, col="grey")

legend("bottomright", legend=c("1","2","3","4","5","6+"),  col=c("red","green","blue","cyan","black","grey"),lwd=1.6, bty="n",ncol=2 )
dev.off()

matog<-read.table("data\\smoothed_matogive_plusg8.csv",sep=",", h=T)
old<-read.table("data\\maturity_old.csv", sep="," ,header=T)  

png("output\\smoothed_matogive_plusg_compareOld.png",  width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(matog$Year, matog$Age1, col="transparent", ylim=c(0,1.2), xlab="Year", ylab="Proportion mature", bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
lines(matog$Year, matog$Age3, col="blue", lwd=1.6)
lines(matog$Year, matog$Age4, col="cyan", lwd=1.6)
lines(matog$Year, matog$Age5, col="black", lwd=1.6)
lines(matog$Year, matog$Age6, col="grey", lwd=1.6)

lines(old$Year,old$X1, col="red",lty="dashed", lwd=1.6)
lines(old$Year, old$X2, col="green",lty="dashed", lwd=1.6)
lines(old$Year, old$X3, col="blue",lty="dashed", lwd=1.6)
lines(old$Year, old$X4, col="cyan",lty="dashed", lwd=1.6)
lines(old$Year, old$X5, col="black",lty="dashed", lwd=1.6)
lines(old$Year, old$X6, col="grey",lty="dashed", lwd=1.6)
legend("bottomright", legend=c("1","2","3","4","5","6+"),  col=c("red","green","blue","cyan","black","grey"),lwd=1.6, bty="n",ncol=2 )
dev.off()


Mat0<-read.table("data\\ogives.year.AREA.csv",sep=",",header=T)    
Mat0<-subset(Mat0, year<=fyear & year>1990 & area=="NORTH") 
Mat0<-Mat0[,c(1,2,3)]
matog<-read.table("data\\smoothed_matogive_plusg_North.csv",sep=",", h=T)

png("output\\smoothed_matogive_North.png",  width=2600, height=2000, res=400)
par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(Mat0[Mat0$age==1,"year"], Mat0[Mat0$age==1,"mat"], col="red", ylim=c(0,1.2), pch=20, xlab="Year", ylab="Proportion mature",main="North", bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
points(Mat0[Mat0$age==2,"year"], Mat0[Mat0$age==2,"mat"], col="green", pch=20)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
points(Mat0[Mat0$age==3,"year"], Mat0[Mat0$age==3,"mat"], col="blue", pch=20)
lines(matog$Year, matog$Age3, col="blue")
points(Mat0[Mat0$age==4,"year"], Mat0[Mat0$age==4,"mat"], col="cyan", pch=20, lwd=1.6)
lines(matog$Year, matog$Age4, col="cyan")
points(Mat0[Mat0$age==5,"year"], Mat0[Mat0$age==5,"mat"], col="black", pch=20, lwd=1.6)
lines(matog$Year, matog$Age5, col="black")
points(Mat0[Mat0$age==6,"year"], Mat0[Mat0$age==6,"mat"] ,col="lightgrey", pch=20, lwd=1.6)
lines(matog$Year, matog$Age6, col="lightgrey")
points(Mat0[Mat0$age==7,"year"], Mat0[Mat0$age==7,"mat"], col="grey", pch=1, lwd=1.6)
lines(matog$Year, matog$Age7, col="grey")
points(Mat0[Mat0$age==8,"year"], Mat0[Mat0$age==8,"mat"], col="darkgrey", pch=17, lwd=1.6)
lines(matog$Year, matog$Age8, col="darkgrey")

legend("bottomright", legend=c("1","2","3","4","5","6","7","8"),  col=c("red","green","blue","cyan","black","light grey","grey", "dark grey"),lwd=1.6, bty="n",ncol=2 )

dev.off()


Mat0<-read.table("data\\ogives.year.AREA.csv",sep=",",header=T)    
Mat0<-subset(Mat0, year<=fyear & year>1990 & area=="SOUTH") 
Mat0<-Mat0[,c(1,2,3)]
matog<-read.table("data\\smoothed_matogive_plusg_South.csv",sep=",", h=T)

png("output\\smoothed_matogive_South.png",  width=2600, height=2000, res=400)
par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(Mat0[Mat0$age==1,"year"], Mat0[Mat0$age==1,"mat"], col="red", ylim=c(0,1.2), pch=20, xlab="Year", ylab="Proportion mature",main="South", bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
points(Mat0[Mat0$age==2,"year"], Mat0[Mat0$age==2,"mat"], col="green", pch=20)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
points(Mat0[Mat0$age==3,"year"], Mat0[Mat0$age==3,"mat"], col="blue", pch=20)
lines(matog$Year, matog$Age3, col="blue")
points(Mat0[Mat0$age==4,"year"], Mat0[Mat0$age==4,"mat"], col="cyan", pch=20, lwd=1.6)
lines(matog$Year, matog$Age4, col="cyan")
points(Mat0[Mat0$age==5,"year"], Mat0[Mat0$age==5,"mat"], col="black", pch=20, lwd=1.6)
lines(matog$Year, matog$Age5, col="black")
points(Mat0[Mat0$age==6,"year"], Mat0[Mat0$age==6,"mat"] ,col="lightgrey", pch=20, lwd=1.6)
lines(matog$Year, matog$Age6, col="lightgrey")
points(Mat0[Mat0$age==7,"year"], Mat0[Mat0$age==7,"mat"], col="grey", pch=1, lwd=1.6)
lines(matog$Year, matog$Age7, col="grey")
points(Mat0[Mat0$age==8,"year"], Mat0[Mat0$age==8,"mat"], col="darkgrey", pch=17, lwd=1.6)
lines(matog$Year, matog$Age8, col="darkgrey")

legend("bottomright", legend=c("1","2","3","4","5","6","7","8"),  col=c("red","green","blue","cyan","black","light grey","grey", "dark grey"),lwd=1.6, bty="n",ncol=2 )

dev.off()


# mat ogive created for plusg=6
matog<-read.table("data\\smoothed_matogive_plusg_North.csv",sep=",", h=T)

png('output\\smoothed_matogive_plusg_North.png', width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(matog$Year, matog$Age1, col="transparent", ylim=c(0,1.2), xlab="Year", ylab="Proportion mature", bty="l",main ="North")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
lines(matog$Year, matog$Age3, col="blue")
lines(matog$Year, matog$Age4, col="cyan")
lines(matog$Year, matog$Age5, col="black")
lines(matog$Year, matog$Age6, col="grey")

legend("bottomright", legend=c("1","2","3","4","5","6+"),  col=c("red","green","blue","cyan","black","grey"),lwd=1.6, bty="n",ncol=2 )

dev.off()


Mat0<-read.table("data\\ogives.year.AREA.csv", sep=",", header=T)    
Mat0<-subset(Mat0, year<=fyear & year>1990 & area=="SOUTH") 
Mat0<-Mat0[,c(1,2,3)]
matog<-read.table("data\\smoothed_matogive_plusg_South.csv",sep=",", h=T)

png('output\\smoothed_matogive_plusg_South.png',  width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(Mat0[Mat0$age==1,"year"], Mat0[Mat0$age==1,"mat"], col="red", ylim=c(0,1.2), pch=20, xlab="Year", ylab="Proportion mature", main="South",bty="l")
lines(matog$year, matog$s.1, col="red", lwd=1.6)
points(Mat0[Mat0$age==2,"year"], Mat0[Mat0$age==2,"mat"], col="green", pch=20)
lines(matog$year, matog$s.2, col="green", lwd=1.6)
points(Mat0[Mat0$age==3,"year"], Mat0[Mat0$age==3,"mat"], col="blue", pch=20)
lines(matog$year, matog$s.3, col="blue")
points(Mat0[Mat0$age==4,"year"], Mat0[Mat0$age==4,"mat"], col="cyan", pch=20, lwd=1.6)
lines(matog$year, matog$s.4, col="cyan")
points(Mat0[Mat0$age==5,"year"], Mat0[Mat0$age==5,"mat"], col="black", pch=20, lwd=1.6)
lines(matog$year, matog$s.5, col="black")
points(Mat0[Mat0$age==6,"year"], Mat0[Mat0$age==6,"mat"] ,col="lightgrey", pch=20, lwd=1.6)
lines(matog$year, matog$s.6, col="lightgrey")
points(Mat0[Mat0$age==7,"year"], Mat0[Mat0$age==7,"mat"], col="grey", pch=1, lwd=1.6)
lines(matog$year, matog$s.7, col="grey")
points(Mat0[Mat0$age==8,"year"], Mat0[Mat0$age==8,"mat"], col="darkgrey", pch=17, lwd=1.6)
lines(matog$year, matog$s.8, col="darkgrey")

legend("bottomright", legend=c("1","2","3","4","5","6","7","8"),  col=c("red","green","blue","cyan","black","light grey","grey", "dark grey"),lwd=1.6, bty="n",ncol=2 )

dev.off()


matog<-read.table("data\\smoothed_matogive_plusg_South.csv", h=T, sep=",")
png('output\\smoothed_matogive_plusg_South.png',  width=2600, height=2000, res=400)

par(mfrow = c(1,1),cex=1, mar = c(4,4,2,1) + 0.1)
plot(matog$Year, matog$Age1, col="transparent", ylim=c(0,1.2), xlab="Year", ylab="Proportion mature", main="South",bty="l")
lines(matog$Year, matog$Age1, col="red", lwd=1.6)
lines(matog$Year, matog$Age2, col="green", lwd=1.6)
lines(matog$Year, matog$Age3, col="blue")
lines(matog$Year, matog$Age4, col="cyan")
lines(matog$Year, matog$Age5, col="black")
lines(matog$Year, matog$Age6, col="lightgrey")
lines(matog$Year, matog$Age7, col="grey")
lines(matog$Year, matog$Age8, col="darkgrey")

legend("bottomright", legend=c("1","2","3","4","5","6","7","8"),  col=c("red","green","blue","cyan","black","lightgrey","grey","darkgrey"),lwd=1.6, bty="n", ncol=2)

dev.off()


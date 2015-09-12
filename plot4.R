par(mfrow=c(2,2))
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?", colClasses = "character")
d<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
d[,7]<-as.numeric(d[,7]);
d[,8]<-as.numeric(d[,8]);
d[,9]<-as.numeric(d[,9]);
d[,3]<-as.numeric(d[,3]);
d[,1]<-as.Date(d[,1],format="%d/%m/%Y")
d[,2]<-as.character.Date(d[,2])
x<-c(1:nrow(d))
ddd<-sapply(x,function(x){paste(d[x,1],d[x,2],sep=" ")})
ddd<-as.POSIXlt(ddd)
r <- as.POSIXct(round(range(ddd), "days"))
plot(ddd,d[,3],type="l",xlab = "",ylab = "Global Active Power(Kilowatts)",axes="FALSE")
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%u")
axis(2,at=seq(0,6,2))
#first one over
plot(ddd,d[,5],type="l",xlab = "detetime",ylab = "voltage",axes="FALSE",col="black")
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%u")
axis(2,at=seq(234,246,4))
#second one over
plot(ddd,d[,7],type="l",xlab = "",ylab = "Energy sub metering",axes="FALSE",col="black")
lines(ddd,d[,8],type="l",col="red")
lines(ddd,d[,9],type="l",col="blue")
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%u")
axis(2,at=seq(0,30,10))
legend("topright",pch="-",bty=n,cex=0.5,col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
#third one finish
plot(ddd,d[,4],type="l",xlab = "detetime",ylab = "Global_reactive_power",axes="FALSE",col="black")
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%u")
axis(2,at=seq(0.0,0.5,0.1))

#all finish
dev.copy(png,file="plot4.png")
dev.off()
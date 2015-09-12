data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?", colClasses = "character")
d<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
d[,7]<-as.numeric(d[,7]);
d[,8]<-as.numeric(d[,8]);
d[,9]<-as.numeric(d[,9]);
d[,1]<-as.Date(d[,1],format="%d/%m/%Y")
d[,2]<-as.character.Date(d[,2])
x<-c(1:nrow(d))
ddd<-sapply(x,function(x){paste(d[x,1],d[x,2],sep=" ")})
ddd<-as.POSIXlt(ddd)
r <- as.POSIXct(round(range(ddd), "days"))
plot(ddd,d[,7],type="l",xlab = "",ylab = "Energy sub metering",axes="FALSE",col="black")
lines(ddd,d[,8],type="l",col="red")
lines(ddd,d[,9],type="l",col="blue")
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%u")
axis(2,at=seq(0,30,10))

legend("topright",pch="-",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()
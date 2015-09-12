data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?", colClasses = "character")
d<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
d[,3]<-as.numeric(d[,3]);
d[,1]<-as.Date(d[,1],format="%d/%m/%Y")
d[,2]<-as.character.Date(d[,2])
hist(x=d[,3],col="red",xlab="Global Active Power(Kilowatts)",xlim=range(0:6),ylim=range(0:1200),main="Global Active Power",axes="FALSE")
axis(1,at=seq(0,6,2))
axis(2,at=seq(0,1200,200))
dev.copy(png,file="plot1.png")
dev.off()

data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?", colClasses = "character")
d<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
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
dev.copy(png,file="plot2.png")
dev.off()
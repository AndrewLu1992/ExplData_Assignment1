household <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
Date <- strptime(household$Date, "%d/%m/%Y")
separater <-Date == "2007-02-01" | Date == "2007-02-02"
household <- household[separater,]
Datetime<-with(household,paste(Date,Time))
Datetime <- strptime(Datetime,"%d/%m/%Y %H:%M:%S")
household$Datetime <- Datetime
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(1,0,0,0))
with(household,plot(Datetime,Global_active_power,type = "l",ylab = "Global Active Power",cex.axis= 0.9,cex.lab=0.9,xlab ='' ))
with(household,plot(Datetime,Voltage,type = "l",ylab = "Voltage",cex.axis= 0.9,cex.lab=0.9))
with(household,plot(Datetime,Sub_metering_1,type = "l",ylab = "Energy Sub Metering",cex.axis= 0.9,cex.lab=0.9,xlab ='' ))
with(household,lines(Datetime,Sub_metering_2,type = "l",col="orangered" ))
with(household,lines(Datetime,Sub_metering_3,type = "l",col="blue" ))
legend("topright",lty=1, col=c("black","orangered","blue"),legend=names(household)[7:9],cex=0.9,bty="n")
with(household,plot(Datetime,Global_reactive_power,type = "l",cex.axis= 0.9,cex.lab=0.9))
dev.off()
household <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
Date <- strptime(household$Date, "%d/%m/%Y")
separater <-Date == "2007-02-01" | Date == "2007-02-02"
household <- household[separater,]
Datetime<-with(household,paste(Date,Time))
Datetime <- strptime(Datetime,"%d/%m/%Y %H:%M:%S")
household$Datetime <- Datetime
png(filename = "plot3.png",width = 480, height = 480)
with(household,plot(Datetime,Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab ='' ))
dev.off()
household <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
Date <- strptime(household$Date, "%d/%m/%Y")
separater <-Date == "2007-02-01" | Date == "2007-02-02"
household <- household[separater,]
png(filename = "plot1.png",width = 480, height = 480)
with(household,hist(Global_active_power,breaks = 11,col ="orangered", xlab = "Global Active Power(kilowatts)",main = "Global Active Power"))
dev.off()
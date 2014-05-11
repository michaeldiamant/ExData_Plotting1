d <- read.csv(file = "data/household_power_consumption.txt", sep = ";", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
dd <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]
dd["datetime"] <- as.POSIXct(paste(dd$Date, dd$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

with(dd, plot(x=datetime, y=Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()

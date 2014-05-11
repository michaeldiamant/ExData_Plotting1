d <- read.csv(file = "data/household_power_consumption.txt", sep = ";", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
dd <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]
dd["datetime"] <- as.POSIXct(paste(dd$Date, dd$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

with(dd, plot(x = datetime, y= Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(dd, points(datetime, Sub_metering_1, col = "black", type = "l"))
with(dd, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(dd, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lwd = "1", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.off()

d <- read.csv(file = "data/household_power_consumption.txt", sep = ";", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
dd <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]

png("plot1.png", width = 480, height = 480)

hist(dd$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

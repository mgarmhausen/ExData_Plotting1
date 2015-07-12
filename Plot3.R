x <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

tmpdate <- x[,c("Date","Time")]

tmpdate$Date2 <- paste(tmpdate$Date, tmpdate$Time)

tmpdate$Date3 <- strptime(tmpdate$Date2, format="%d/%m/%Y %H:%M:%S")

x$Date <- as.Date(x$Date, format="%d/%m/%Y")

x$Date2 <- tmpdate$Date3

timeframe <- x[x$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

head(timeframe)


png("plot3.png", width = 480, height = 480, units = "px")
plot(timeframe$Date2, as.numeric(timeframe$Sub_metering_1), type = "l", ylab="Energy sub metering", xlab="")
lines(timeframe$Date2, as.numeric(timeframe$Sub_metering_2), col="red")
lines(timeframe$Date2, as.numeric(timeframe$Sub_metering_3), col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))


dev.off()

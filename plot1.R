x <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

x$Date <- as.Date(x$Date, format="%d/%m/%Y")

x$Time <- strptime(x$Time, format="%H:%M:%S")

timeframe <- x[x$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(timeframe$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

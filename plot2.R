setwd(dir = "")
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = link, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

x <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

tmpdate <- x[,c("Date","Time")]

tmpdate$Date2 <- paste(tmpdate$Date, tmpdate$Time)

tmpdate$Date3 <- strptime(tmpdate$Date2, format="%d/%m/%Y %H:%M:%S")

x$Date <- as.Date(x$Date, format="%d/%m/%Y")

x$Date2 <- tmpdate$Date3

timeframe <- x[x$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

head(timeframe)


png("plot2.png", width = 480, height = 480, units = "px")
plot(timeframe$Date2, as.numeric(timeframe$Global_active_power), type = "l", ylab="Global Active Power (kilowatts)", xlab="")


  dev.off()

data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   na.strings="?")
as.Date(data$Date)
data <- na.omit(data)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))

par(mfrow = c(2, 2))
plot(data1$DateTime, data1$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data1$DateTime, data1$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data1$DateTime, data1$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data1$DateTime, data1$Sub_metering_2, col = 'red')
lines(data1$DateTime, data1$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data1$DateTime, data1$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')


dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   na.strings="?")
as.Date(data$Date)
data <- na.omit(data)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))

plot(data1$DateTime, data1$Global_active_power, type="l", col="black",
     xlab="", ylab="Global Active Power (kilowatts)")



dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

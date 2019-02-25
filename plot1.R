data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   na.strings="?")
as.Date(data$Date)
data <- na.omit(data)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]


hist(data1$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


## Open the file
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?" ,  colClasses = c("character","character",rep("numeric",7)))

## Subset the dates and fix the dates
startDate = "1/2/2007"
endDate = "2/2/2007"
data <-data[data$Date == startDate | data$Date == endDate,]
temp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(temp, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(temp, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(temp, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(temp, data$Sub_metering_2, col="red", type = "l")
lines(temp, data$Sub_metering_3,col="blue", type = "l")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(temp, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime" )
dev.off()


## Open the file
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?" ,  colClasses = c("character","character",rep("numeric",7)))

## Subset the dates and fix the dates
startDate = "1/2/2007"
endDate = "2/2/2007"
data <-data[data$Date == startDate | data$Date == endDate,]
temp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png("plot2.png", width = 480, height = 480)
par(mfrow = c(1, 1))
plot(temp, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="" )
dev.off()
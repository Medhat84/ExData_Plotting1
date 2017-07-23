library(sqldf)
db <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", header = TRUE, sep = ";")
db$datetime <- strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar=c(5,5,1,1), oma = c(2,2,2,2))

plot(db$datetime, db$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines(db$datetime, db$Global_active_power, type = "l")

plot(db$datetime, db$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(db$datetime, db$Voltage, type = "l")

plot(db$datetime, db$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(db$datetime, db$Sub_metering_1, type = "l")
lines(db$datetime, db$Sub_metering_2, type = "l", col = "red")
lines(db$datetime, db$Sub_metering_3, type = "l", col = "blue")
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = 0.9)

plot(db$datetime, db$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(db$datetime, db$Global_reactive_power, type = "l")

dev.off()
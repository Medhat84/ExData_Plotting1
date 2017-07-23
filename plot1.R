##temp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
##db <- temp[which(temp$Date == "1/2/2007" | temp$Date == "2/2/2007"), ]
##rm("temp")
library(sqldf)
db <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", header = TRUE, sep = ";")
png("plot1.png", width = 480, height = 480)
hist(db$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
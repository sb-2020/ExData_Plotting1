pdata <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
pdata$datetime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S") 
plot(pdata$datetime, pdata$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", main="")
par(new = TRUE)
plot(pdata$datetime, pdata$Sub_metering_2, type ="l", col = "red", xlab="", 
     ylab="", axes = FALSE, ylim = range(pdata$Sub_metering_1))
par(new = TRUE)
plot(pdata$datetime, pdata$Sub_metering_3, type ="l", col = "blue", xlab ="", 
     ylab ="", axes = FALSE, ylim = range(pdata$Sub_metering_1))
par(new = FALSE)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
     lty = c(1,1,1), col = c("black", "red", "blue"))
dev.print(png, file = "plot3.png", width = 480, height = 480)




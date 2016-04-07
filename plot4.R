pdata <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
pdata$datetime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S") 

par(mfrow = c(2,2) ,oma = c(0.2,0.2,0.2,0.2), mar =c(4,4,1,1))

plot(pdata$datetime, pdata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", main="", cex.lab = .75, cex.axis = 0.5)

plot(pdata$datetime, pdata$Voltage, type = "l", xlab = "datetime", 
     ylab = "Global Active Power (kilowatts)", main="", cex.lab = .75, cex.axis = 0.5)

plot(pdata$datetime, pdata$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", main="", cex.lab = .75, cex.axis = 0.75)
par(new = TRUE)
plot(pdata$datetime, pdata$Sub_metering_2, type ="l", col = "red", xlab="", 
     ylab="", axes = FALSE, ylim = range(pdata$Sub_metering_1), cex.lab = .75, cex.axis = 0.5)
par(new = TRUE)
plot(pdata$datetime, pdata$Sub_metering_3, type ="l", col = "blue", xlab ="", 
     ylab ="", axes = FALSE, ylim = range(pdata$Sub_metering_1), cex.lab = .75, cex.axis = 0.5)
par(new = FALSE)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), cex = .75)

plot(pdata$datetime, pdata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", main="", cex.lab = .75, cex.axis = 0.5)

dev.print(png, file = "plot4.png", width = 480, height = 480)

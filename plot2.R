pdata <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
pdata$datetime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S") 
plot(pdata$datetime, pdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main="")
dev.print(png, file = "plot2.png", width = 480, height = 480)


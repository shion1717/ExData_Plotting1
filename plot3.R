library(lubridate)
library(tidyverse)

    #read in data
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

    #format data
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

data <- cbind(datetime,data)


    #filter data
data <- filter(data, year(datetime) == 2007, month(datetime) == 2, day(datetime) == 1| day(datetime) == 2)

    #open png graphics device
png(filename = "plot3.png",
    width = 480, height = 480)

    #plot the graph
plot(data$datetime,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$datetime,data$Sub_metering_2,type = "l", col = "red")
points(data$datetime,data$Sub_metering_3,type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1)

    #close png graphics device
dev.off()
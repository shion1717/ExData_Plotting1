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
png(filename = "plot1.png",
    width = 480, height = 480)

    #plot the graph
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

    #close graphics device
dev.off()

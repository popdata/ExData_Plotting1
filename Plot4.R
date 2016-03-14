#C:/Users/Office Depot/Pictures/Documents/Git/Exploratory

#load libraries
library(data.table)
library(dplyr)

# read data
DT <- fread("household_power_consumption.txt", na.strings = "?")

# filter data to relevant dates
DT <- filter(DT, (as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")))
mutate(DT,DateTime = paste(Date,Time))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

plot(DT$Global_active_power, ylab = "Global Active Power", xaxt="n", xlab="", type = "n" )
axis(1, at=1:2, labels=unique(weekdays(DT$Date)))
lines(DT$Global_active_power)

plot(DT$Voltage, ylab = "Voltage", xaxt="n",yaxt="n", xlab="datetime", type = "n" )
axis(1, at=1:2, labels=unique(weekdays(DT$Date)))
axis(2, at=234:246, las=2)
lines(DT$Voltage)



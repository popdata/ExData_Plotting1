

# load libraries
library(data.table)
library(dplyr)

# read data
DT <- fread("household_power_consumption.txt", na.strings = "?")

# filter data to relevant dates
DT <- filter(DT, (as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")))
mutate(DT,DateTime = paste(Date,Time))


plot(DT$Global_active_power, ylab = "Global Active Power(kilowatts)", xlab = weekdays(DT$Date, abbreviate = TRUE), type = "n" )
lines(DT$Global_active_power)

#copy pplot to png ile
dev.copy(png, file = "Plot2.png", width= 480, height = 480, units = "px")
dev.off()

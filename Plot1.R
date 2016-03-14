# Plot 1 Global Active Power

# load libraries
library(data.table)
library(dplyr)

# read data
DT <- fread("household_power_consumption.txt", na.strings = "?")

# filter data to relevant dates
DT <- filter(DT, (as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")))

#create histogram
hist(fs$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red" )

#copy pplot to png ile
dev.copy(png, file = "Plot1.png", width= 480, height = 480, units = "px")
dev.off()

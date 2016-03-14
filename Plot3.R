

#load libraries
library(data.table)
library(dplyr)

# read data
DT <- fread("household_power_consumption.txt", na.strings = "?")

# filter data to relevant dates
DT <- filter(DT, (as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")))
mutate(DT,DateTime = paste(Date,Time))

with(DT,{plot(Sub_metering_1, type="n") ; plot(Sub_metering_2, col="red", type="n") ; plot(Sub_metering_3, col="blue", ylab="Energy sub metering", type="n", ylim = c(0,30), xaxt="n",xlab="")})

with(DT,{lines(Sub_metering_1) ; lines(Sub_metering_2, col="red") ; lines(Sub_metering_3, col="blue")})

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1, 1, 1), pch =c(NA,NA,NA), cex = .5)
axis(1, at=1:2, labels=unique(weekdays(DT$Date)))

#copy pplot to png ile
dev.copy(png, file = "Plot3.png", width= 480, height = 480, units = "px")
dev.off()

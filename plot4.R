#set classes for colunns for faster reading of large data set
tab5rows <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

#read in the table, use csv for speed
powertot <- read.csv("household_power_consumption.txt", sep = ";", header=  TRUE, na.strings = "?", colClasses = classes)

#subest the data for two dates for course project
powersub<-subset(powertot, Date=="1/2/2007"|Date=="2/2/2007")

#modify date and time
powersub$dt <-paste(powersub$Date, powersub$Time, sep = " " )
powersub$x <- strptime(powersub$dt, format='%d/%m/%Y %H:%M:%S')
#not needed for plot but can use to check day of the week, %a - abbrev weekday
powersub$xaxis <- strftime(powersub$x, '%a %H:%M')

png(file = "plot4.png",width=480,height=480) ## Open png device; create plot in my working directory
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(powersub, {
        plot(x,Global_active_power, type="l", ylab="Global Active Power", xlab="")
        plot(x, Voltage, type="l", ylab="Voltage", xlab="datetime")
        plot(x, Sub_metering_1 , type="l", ylab="Energy sub metering", xlab="")
        lines(powersub$x, powersub$Sub_metering_2, col = "red")
        lines(powersub$x, powersub$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"), bty="n")
        plot(x, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off() ## Close the png file device

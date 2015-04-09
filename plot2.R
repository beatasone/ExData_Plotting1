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

png(file = "plot2.png",width=480,height=480) ## Open png device; create plot in my working directory
plot(powersub$x, powersub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off() ## Close the png file device

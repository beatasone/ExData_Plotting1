#set classes for colunns for faster reading of large data set
tab5rows <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

#read in the table, use csv for speed
powertot <- read.csv("household_power_consumption.txt", sep = ";", header=  TRUE, na.strings = "?", colClasses = classes)

#subest the data for two dates for course project
powersub<-subset(powertot, Date=="1/2/2007"|Date=="2/2/2007")

#create plot1
png(filename = "plot1.png",width=480,height=480) ## Open png device; create plot in my working directory
hist(powersub$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() ## Close the png file device


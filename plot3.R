#Plots a graph based on the household power consumption data set, graphing energy sub-metering 1, 2, and 3 over 2/1/2007 and 2/2/2007.
#Assumes household_power_consumption.txt is available in working directory and outputs plot3.png to the working directory.

plot3<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date <- as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Sub_metering_1 <- as.numeric(filteredtable$Sub_metering_1)
  filteredtable$Sub_metering_2 <- as.numeric(filteredtable$Sub_metering_2)
  filteredtable$Sub_metering_3 <- as.numeric(filteredtable$Sub_metering_3)
  datetime=strptime(paste(filteredtable$Date, filteredtable$Time), format = "%Y-%m-%d %H:%M:%S")
  png(filename="plot3.png",width=480,height=480,unit="px")
  plot(datetime, filteredtable$Sub_metering_1, ylab = "Energy sub metering", type = "l")
  points(datetime, filteredtable$Sub_metering_2, type = "l", col = "red")
  points(datetime, filteredtable$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}
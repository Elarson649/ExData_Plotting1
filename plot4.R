#Plots 4 graphs based on the household power consumption data set, graphing a few variables over 2/1/2007 and 2/2/2007, including
#global active power, global reactive power, Sub_metering_1/2/3, and voltage. Assumes household_power_consumption.txt in the working
#directory and outputs plot4.png to the working directory.

plot4<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date <- as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Sub_metering_1 <- as.numeric(filteredtable$Sub_metering_1)
  filteredtable$Sub_metering_2 <- as.numeric(filteredtable$Sub_metering_2)
  filteredtable$Sub_metering_3 <- as.numeric(filteredtable$Sub_metering_3)
  filteredtable$Global_active_power<-as.numeric(filteredtable$Global_active_power)
  filteredtable$Global_reactive_power<-as.numeric(filteredtable$Global_reactive_power)
  filteredtable$Voltage<-as.numeric(filteredtable$Voltage)
  datetime=strptime(paste(filteredtable$Date, filteredtable$Time), format = "%Y-%m-%d %H:%M:%S")
  png(filename="plot4.png",width=480,height=480,unit="px")
  par(mfcol=c(2,2))
  plot(datetime, filteredtable$Global_active_power, ylab="Global Active Power (kilowatts)", type="l")
  plot(datetime, filteredtable$Sub_metering_1, ylab = "Energy sub metering", type = "l")
  points(datetime, filteredtable$Sub_metering_2, type = "l", col = "red")
  points(datetime, filteredtable$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(datetime, filteredtable$Voltage, ylab="Voltage", type="l")
  plot(datetime, filteredtable$Global_reactive_power, ylab="Global Reactive Power (kilowatts)", type="l")
  dev.off()
}
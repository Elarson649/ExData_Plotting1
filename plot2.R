#Plots a graph based on the household power consumption data set, graphing the global active power over 2/1/2007 and 2/2/2007.
#Assumes household_power_consumption.txt is available in working directory and outputs plot2.png to the working directory.

plot2<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date<-as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Global_active_power<-as.numeric(filteredtable$Global_active_power)
  datetime=strptime(paste(filteredtable$Date,filteredtable$Time),format="%Y-%m-%d %H:%M:%S")
  png(filename="plot2.png",width=480,height=480,unit="px")
  plot(datetime, filteredtable$Global_active_power, ylab="Global Active Power (kilowatts)", type="l")
  dev.off()
}
#Plots a graph based on the household power consumption data set, graphing the frequency of global active powers over 2/1/2007 and 2/2/2007.
#Assumes household_power_consumption.txt is available in working directory and outputs plot1.png to the working directory.

plot1<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date<-as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Global_active_power<-as.numeric(filteredtable$Global_active_power)
  png(filename="plot1.png",width=480,height=480,unit="px")
  hist(filteredtable$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()
}
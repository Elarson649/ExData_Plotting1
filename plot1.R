plot1<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date<-as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Global_active_power<-as.numeric(filteredtable$Global_active_power)
  png(filename="plot1.png",width=480,height=480,unit="px")
  hist(filteredtable$Global_active_power,col="red",xlab="Global Active Period (kilowatts)",main="Global Active Power")
  dev.off()
}
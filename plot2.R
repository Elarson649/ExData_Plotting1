plot2<-function(){
  fulltable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  filteredtable <- subset(fulltable,Date %in% c("1/2/2007","2/2/2007"))
  filteredtable$Date<-as.Date(filteredtable$Date,"%d/%m/%Y")
  filteredtable$Global_active_power<-as.numeric(filteredtable$Global_active_power)
  datetime=strptime(paste(filteredtable$Date,filteredtable$Time),format="%Y-%m-%d %H:%M:%S")
  png(filename="plot2.png",width=480,height=480,unit="px")
  plot(datetime, filteredtable$Global_active_power, ylab="Global Active Period (kilowatts)", type="l")
  dev.off()
}
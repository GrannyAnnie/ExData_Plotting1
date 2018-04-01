##Read and subset data for specific dates, remove unnecessary data because ancient laptop hates it
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
  subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  rm(data)
 
##Change class, combine and format date and time  
  global_active_power <- as.numeric(subset_data$Global_active_power)
  date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plot  
  png("plot2.png", width=480, height=480)
  plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()

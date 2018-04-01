##Read and subset data for specific dates, remove unnecessary data because ancient laptop hates it
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
  subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  rm(data)

##Change class, combine and format date and time     
  global_active_power <- as.numeric(subset_data$Global_active_power)
  sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
  sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
  sub_metering3 <- as.numeric(subset_data$Sub_metering_3)
  date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plot    
  png("plot3.png", width=480, height=480)
  plot(date_time, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
  lines(date_time, sub_metering2, type="l", col="red")
  lines(date_time, sub_metering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  dev.off()

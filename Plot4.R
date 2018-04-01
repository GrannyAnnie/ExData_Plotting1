##Read and subset data for specific dates, remove unnecessary data because ancient laptop hates it
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
  subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  rm(data)

##Change class, combine and format date and time   
  global_active_power <- as.numeric(subset_data$Global_active_power)
  global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
  voltage <- as.numeric(subset_data$Voltage)
  sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
  sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
  sub_metering3 <- as.numeric(subset_data$Sub_metering_3)
  date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
##Plot  
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(date_time, voltage, type = "l", xlab="datetime", ylab="Voltage")
  plot(date_time, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
  lines(date_time, sub_metering2, type="l", col="red")
  lines(date_time, sub_metering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.off()
  

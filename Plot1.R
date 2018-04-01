##Read and subset data for specific dates, remove unnecessary data because ancient laptop hates it
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
  subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  rm(data)
  
##Change class  
  global_active_power <- as.numeric(subset_data$Global_active_power)
  
##Plot
  png("plot1.png", width=480, height=480)
  hist(global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()

  
  
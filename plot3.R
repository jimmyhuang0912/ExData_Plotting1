#Reading & Organize Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", colClasses=c("character","character","numeric",
                                                    "numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
install.packages("dplyr")
library("dplyr")
subdata <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
subdata2 <- mutate(subdata, DateTime = as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))
subdata3 <- select(subdata2, Global_active_power:DateTime)

#Plot Data
with(subdata3, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(2,2,2), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.75)
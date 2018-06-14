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
plot(subdata3$Global_active_power~subdata3$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
setwd("C://Work//Learnings")


library(data.table)
library(dplyr)
df <- fread("household_power_consumption.txt")
df2 <- df %>% filter(df$Date %in% c("1/2/2007","2/2/2007"))
Sys.setlocale(category = "LC_ALL",locale = "English")
datetime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles") 

globalActivePower <- as.numeric(df2$Global_active_power)
subMetering1 <- as.numeric(df2$Sub_metering_1)
subMetering2 <- as.numeric(df2$Sub_metering_2)
subMetering3 <- as.numeric(df2$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


setwd("C://Work//Learnings")


library(data.table)
library(dplyr)
df <- fread("household_power_consumption.txt")
df2 <- df %>% filter(df$Date %in% c("1/2/2007","2/2/2007"))
Sys.setlocale(category = "LC_ALL",locale = "English")
datetime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
globalActivePower <- as.numeric(df2$Global_active_power)
subMetering1 <- as.numeric(df2$Sub_metering_1)
subMetering2 <- as.numeric(df2$Sub_metering_2)
subMetering3 <- as.numeric(df2$Sub_metering_3)
voltage <- as.numeric(df2$Voltage)
globalReactivePower <- as.numeric(df2$Global_reactive_power)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


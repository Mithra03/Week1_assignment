setwd("C://Work//Learnings")


library(data.table)
library(dplyr)
df <- fread("household_power_consumption.txt")
df2 <- df %>% filter(df$Date %in% c("1/2/2007","2/2/2007"))
Sys.setlocale(category = "LC_ALL",locale = "English")
datetime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles") 
globalActivePower <- as.numeric(df2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

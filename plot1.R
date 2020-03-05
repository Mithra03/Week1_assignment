setwd("C://Work//Learnings")


library(data.table)
library(dplyr)
df <- fread("household_power_consumption.txt")

df2 <- df %>% filter(df$Date %in% c("1/2/2007","2/2/2007"))
df2$Date <- as.Date(paste0(substr(df2$Date,5,8),"/0",substr(df2$Date,3,3),"/0",substr(df2$Date,1,1)))
globalActivePower <- as.numeric(df2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

library(dplyr)
data <- read.csv2("household_power_consumption.txt") %>%
        filter(Date=="1/2/2007"|Date=="2/2/2007") %>%
        mutate(Date.Time=paste(Date,Time),Date.Time=as.POSIXct(Date.Time, format="%d/%m/%Y %H:%M:%OS"),.before=Date,Global_active_power=as.numeric(Global_active_power)) %>%
        select(-c(Date,Time))
png("plot2.png",480,480)
plot(data$Date.Time,data$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
library(dplyr)
data <- read.csv2("household_power_consumption.txt") %>%
        filter(Date=="1/2/2007"|Date=="2/2/2007") %>%
        mutate(Date.Time=paste(Date,Time),Date.Time=as.POSIXct(Date.Time, format="%d/%m/%Y %H:%M:%OS"),.before=Date,Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3)) %>%
        select(-c(Date,Time))
png("plot3.png",480,480)
plot(data$Date.Time,data$Sub_metering_1,type = "l",col="black",ylab="Energy sub metering",xlab="")
points(data$Date.Time,data$Sub_metering_2,type = "l",col="red")
points(data$Date.Time,data$Sub_metering_3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
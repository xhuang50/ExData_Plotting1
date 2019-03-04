wd_holder<-getwd()
list.files(getwd())
file_holder<-read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
dataset <- file_holder[file_holder$Date %in% c("1/2/2007", "2/2/2007"),]
str(dataset)

###Plot 1
dataset$Global_active_power<-as.numeric(dataset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col="red", main="Golbal Active Power", xlab = "Global Activity Power", ylab="Frequency")
dev.off()

###Plot2
x_time <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(x_time, dataset$Global_active_power, type="l",  ylab="Golbal Active Power (Kilowatts)")
dev.off()

###Plot3
dataset$Sub_metering_1<-as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2<-as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3<-as.numeric(dataset$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(x_time, dataset$Sub_metering_1, type='l', ylab = "Energy sub metering", col="black")
lines(x_time, dataset$Sub_metering_2, col="red")
lines(x_time, dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

###Plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

hist(dataset$Global_active_power, col="red", main="Golbal Active Power", xlab = "Global Activity Power", ylab="Frequency")

plot(x_time, dataset$Global_active_power, type="l",  ylab="Golbal Active Power (Kilowatts)")

plot(x_time, dataset$Sub_metering_1, type='l', ylab = "Energy sub metering", col="black")
lines(x_time, dataset$Sub_metering_2, col="red")
lines(x_time, dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(x_time, dataset$Global_reactive_power, type="l", xlab = "datetime")

dev.off()
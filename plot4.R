data <- read.csv("household_power_consumption.txt",na.strings='?',sep=";",header=TRUE)

data <- data[which(data$Date == '1/2/2007'| data$Date == '2/2/2007'),]

#data$DateTime <- strptime(as.Date(data$Date,format="%d/%m/%Y"),format="%a")
n=length(data$Global_active_power)

##plot4
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))

plot(data$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1, at=c(1,n/2,n), labels=c("Thu","Fri","Sat"))

plot(data$Voltage,type='l',ylab="Voltage",xaxt="n",xlab="datetime")
axis(1, at=c(1,n/2,n), labels=c("Thu","Fri","Sat"))

plot(data$Sub_metering_1,type='l',xaxt="n",xlab="",ylab="Energy sub metering")
axis(1, at=c(1,n/2,n), labels=c("Thu","Fri","Sat"))
lines(data$Sub_metering_2,col='red')
lines(data$Sub_metering_3,col='blue')
legend("topright", 1:3, legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=c(1,1),bty="n")

plot(data$Global_reactive_power,type='l',xaxt="n",xlab="datetime",ylab="Global_reactive_power")
axis(1, at=c(1,n/2,n), labels=c("Thu","Fri","Sat"))

dev.off()


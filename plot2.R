data <- read.csv("household_power_consumption.txt",na.strings='?',sep=";",header=TRUE)

data <- data[which(data$Date == '1/2/2007'| data$Date == '2/2/2007'),]

#data$DateTime <- strptime(as.Date(data$Date,format="%d/%m/%Y"),format="%a")
n=length(data$Global_active_power)

##plot2
png("plot2.png",width=480,height=480,units="px")
plot(data$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1, at=c(1,n/2,n), labels=c("Thu","Fri","Sat"))
dev.off()
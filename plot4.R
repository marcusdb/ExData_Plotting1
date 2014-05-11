# download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
pdata<-read.csv("household_power_consumption.txt",sep=";")
# verify pdata head(pdata)

#filter by date
fdata<-pdata[as.Date(pdata$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01','2007-02-02')),]
#convert to date
fdata$VDate<-strptime(paste(fdata$Date, fdata$Time),"%d/%m/%Y %H:%M:%S")

#adjust data
fdata$Global_active_power<-as.numeric(as.character(fdata$Global_active_power))
fdata$Global_active_power[is.na(fdata$Global_active_power)] <- 0
#plot4
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(fdata$VDate, fdata$Global_active_power, type="n",ylab="Global Active Power",xlab="") 
lines(fdata$VDate, fdata$Global_active_power,type="l") 

plot(fdata$VDate, fdata$Voltage, type="n",ylab="Global Active Power",xlab="datetime") 
lines(fdata$VDate, fdata$Voltage,type="l") 

plot(fdata$VDate, fdata$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="") 
lines(fdata$VDate,fdata$Sub_metering_1,type="l") 
lines(fdata$VDate,fdata$Sub_metering_2,type="l",col="red") 
lines(fdata$VDate,fdata$Sub_metering_3,type="l",col="blue") 
legend("topright",legend=names(fdata)[seq(7,9)],lty=1,col=c("black","red","blue"),bty = "n" )

plot(fdata$VDate, fdata$Global_reactive_power, type="n",ylab="Global_reactive_power",xlab="datetime") 
lines(fdata$VDate, fdata$Global_reactive_power,type="l") 

dev.off()






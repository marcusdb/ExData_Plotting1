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



#plot2
png(file="plot2.png",width=480,height=480)
plot(fdata$VDate, fdata$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xlab="") 
lines(fdata$VDate, fdata$Global_active_power,type="l") 
dev.off()



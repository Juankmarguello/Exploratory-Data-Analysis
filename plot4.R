library(lubridate)
data<-read.table('household_power_consumption.txt',header = T,sep = ';')
data$Datetime<-paste0(data$Date,' ',data$Time)
data$Datetime<-dmy_hms(data$Datetime)
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data<-data[data$Date=='2007-02-01'|data$Date=='2007-02-02',]

png('plot4.png',width = 480,height = 480)

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Datetime,as.numeric(sub(',','.',data$Global_active_power)),
     type='l',
     ylab = 'Global Active Power',
     xlab = '')
plot(data$Datetime,as.numeric(sub(',','.',data$Voltage)),
     type='l',
     ylab = 'Voltage',
     xlab = 'datetime')
plot(data$Datetime,as.numeric(sub(',','.',data$Sub_metering_1)),
     type='l',
     ylab = 'Energy sub metering',
     xlab = '')
lines(data$Datetime,as.numeric(sub(',','.',data$Sub_metering_2)),
      col='red')
lines(data$Datetime,as.numeric(sub(',','.',data$Sub_metering_3)),
      col='blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lwd=c(1,1,1),lty=1,  bty="n")
plot(data$Datetime,as.numeric(sub(',','.',data$Global_reactive_power)),
     type='l',
     ylab = 'Global_reactive_power',
     xlab = 'datetime')
dev.off()

library(lubridate)
data<-read.table('household_power_consumption.txt',header = T,sep = ';')
data$Datetime<-paste0(data$Date,' ',data$Time)
data$Datetime<-dmy_hms(data$Datetime)
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data<-data[data$Date=='2007-02-01'|data$Date=='2007-02-02',]

png('plot2.png',width = 480,height = 480)
plot(data$Datetime,as.numeric(sub(',','.',data$Global_active_power)),
     type='l',
     ylab = 'Global Active Power (Kilowatts)',
     xlab = '')
dev.off()

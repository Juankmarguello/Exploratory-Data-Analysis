data<-read.table('household_power_consumption.txt',header = T,sep = ';')
class(data$Date)
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data<-data[data$Date=='2007-02-01'|data$Date=='2007-02-02',]

png('plot1.png',width = 480,height = 480)
hist(as.numeric(sub(',','.',data$Global_active_power)),
     main='Global Active Power',
     xlab = 'Global Active Power (Kilowatts)',
     col='red')
dev.off()


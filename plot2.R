##Open file and subset as necessary
test1<-read.table("./household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
test2<-subset(test1,test1$Date=="1/2/2007"|test1$Date=="2/2/2007")
powerconsumption<-test2

##Convert to POSIXct format for plots
powerconsumption$weekdayy<-as.POSIXct(strptime(paste(test2[,1],test2[,2]),format="%d/%m/%Y %H:%M:%S"))

##Open graphic device
png(file="plot2.png")

##Plot paramters
par(font.axis=2,font.lab=2)
with(powerconsumption,plot(weekdayy,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)"))

##Turn device off
dev.off()
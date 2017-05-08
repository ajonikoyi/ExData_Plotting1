##Open file and subset as necessary
test1<-read.table("./household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
test2<-subset(test1,test1$Date=="1/2/2007"|test1$Date=="2/2/2007")
powerconsumption<-test2

##Convert to POSIXct format for plots
powerconsumption$weekdayy<-as.POSIXct(strptime(paste(test2[,1],test2[,2]),format="%d/%m/%Y %H:%M:%S"))

##Open graphic device
png(file="plot4.png")

##Plot parameters
par(mfrow=c(2,2),font.axis=2,font.lab=2)

with(powerconsumption,plot(weekdayy,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)"))

with(powerconsumption,plot(weekdayy,Voltage,type="l",xlab="datetime"))

with(powerconsumption,plot(weekdayy,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(powerconsumption,lines(weekdayy,Sub_metering_2,type="l",col="red"))
with(powerconsumption,lines(weekdayy,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(powerconsumption,plot(weekdayy,Global_reactive_power,type="l",xlab="datetime"))

##TUrn device off
dev.off()
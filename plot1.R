##Open table and subset as necessary
test1<-read.table("./household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
test2<-subset(test1,test1$Date=="1/2/2007"|test1$Date=="2/2/2007")
powerconsumption<-test2

##Convert time to POSIXct format for plots
powerconsumption$weekdayy<-as.POSIXct(strptime(paste(test2[,1],test2[,2]),format="%d/%m/%Y %H:%M:%S"))

##Open graphic device png
png(file="plot1.png")

##plot parameters
par(font.axis=2,font.lab=2)
with(powerconsumption,hist(Global_active_power,main="Global active power",col="orangered1",xlab="Global active power (kilowatts)"))

##turn device off
dev.off()
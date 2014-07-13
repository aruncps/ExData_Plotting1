getwd()
setwd("C:\\Mac Move\\eBooks\\Coursera\\Specialization\\Data Science\\04 Exploratory Data Analysis\\Week 1\\exdata-data-household_power_consumption")

consumption=read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings = c("?"))
consumptionToDate=consumption
consumptionToDate$Time <- strptime(paste(consumptionToDate$Date, consumptionToDate$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
consumptionToDate$Date <- as.Date(consumptionToDate$Date,"%d/%m/%Y")
consumptionToDateFiltered <- consumptionToDate[consumptionToDate$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

png(filename = "C:\\Users\\shanmuga\\ExData_Plotting1\\plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(consumptionToDateFiltered,plot(Time,Global_active_power,type="l",main = "", xlab="",ylab="Global Active Power (kilowatts)"))
with(consumptionToDateFiltered,plot(Time,Voltage,type="l",main = "", xlab="datetime",ylab="Voltage"))
with(consumptionToDateFiltered,plot(Time,Sub_metering_1,col="black",type="l",main = "", xlab="",ylab="Energy sub metering"))
with(consumptionToDateFiltered,lines(Time,Sub_metering_2,col="red",type="l"))
with(consumptionToDateFiltered,lines(Time,Sub_metering_3,col="blue",type="l"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
with(consumptionToDateFiltered,plot(Time,Global_reactive_power,type="l",main = "", xlab="datetime",ylab="Global_reactive_power"))
dev.off()

getwd()
setwd("C:\\Mac Move\\eBooks\\Coursera\\Specialization\\Data Science\\04 Exploratory Data Analysis\\Week 1\\exdata-data-household_power_consumption")

consumption=read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings = c("?"))
consumptionToDate=consumption
consumptionToDate$Time <- strptime(paste(consumptionToDate$Date, consumptionToDate$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
consumptionToDate$Date <- as.Date(consumptionToDate$Date,"%d/%m/%Y")
consumptionToDateFiltered <- consumptionToDate[consumptionToDate$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

png(filename = "C:\\Users\\shanmuga\\ExData_Plotting1\\plot2.png",width = 480, height = 480)
with(consumptionToDateFiltered,plot(Time,Global_active_power,type="l",main = "", xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
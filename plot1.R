getwd()
setwd("C:\\Mac Move\\eBooks\\Coursera\\Specialization\\Data Science\\04 Exploratory Data Analysis\\Week 1\\exdata-data-household_power_consumption")

consumption=read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings = c("?"))
nrow(consumption)
head(consumption)
consumptionToDate=consumption
consumptionToDate$Date <- as.Date(consumptionToDate$Date,"%d/%m/%Y")
consumptionToDateFiltered <- consumptionToDate[consumptionToDate$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
head(consumptionToDateFiltered)

png(filename = "C:\\Users\\shanmuga\\ExData_Plotting1\\plot1.png",width = 480, height = 480)
hist(consumptionToDateFiltered$Global_active_power,main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red") 
dev.off()
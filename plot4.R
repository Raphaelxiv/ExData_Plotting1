data<-read.table("household_power_consumption.txt",sep=";",nrows = 69517,skip = 66637,colClasses="character")[1:2880,]
colnames(data)<-colnames(read.table("household_power_consumption.txt",sep=";",nrows = 1,header=TRUE))
data$Date<-as.Date(data$Date, "%d/%m/%Y")

library(dplyr)

data<-mutate(data,datetime=as.numeric(strptime(paste(as.character(data$Date),as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S")))

png(filename="plot4.png",width = 480, height = 480)

par(mfcol=c(2,2))
#plot1
with(data,plot(datetime,Global_active_power,xaxt="n",xlab = "",ylab = "Global Active Power (kilowatts)",type =  "l"))
axis.POSIXct(1, data$Date, format="%a")
#plot2
with(data,plot(datetime,Sub_metering_1,xaxt="n",xlab = "",ylab = "Energy sub metering" ,type =  "n"))
axis.POSIXct(1, data$Date, format="%a")
with(data, {
  lines(datetime,Sub_metering_1)
  lines(datetime,Sub_metering_2, col="red")
  lines(datetime,Sub_metering_3, col="blue")
})
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1,bty="n")
#plot3
with(data,plot(datetime,Voltage,xaxt="n" ,type =  "l"))
axis.POSIXct(1, data$Date, format="%a")
#plot4
with(data,plot(datetime,Global_reactive_power,xaxt="n" ,type =  "l"))
axis.POSIXct(1, data$Date, format="%a")

dev.off()

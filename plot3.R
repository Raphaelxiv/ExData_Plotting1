data<-read.table("household_power_consumption.txt",sep=";",nrows = 69517,skip = 66637,colClasses="character")[1:2880,]
colnames(data)<-colnames(read.table("household_power_consumption.txt",sep=";",nrows = 1,header=TRUE))
data$Date<-as.Date(data$Date, "%d/%m/%Y")

library(dplyr)

data<-mutate(data,datetime=as.numeric(strptime(paste(as.character(data$Date),as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S")))

png(filename="plot3.png",width = 480, height = 480)

#plotting

with(data,plot(datetime,Sub_metering_1,xaxt="n",xlab = "",ylab = "Energy sub metering" ,type =  "n"))
axis.POSIXct(1, data$Date, format="%a")
with(data, {
  lines(datetime,Sub_metering_1)
  lines(datetime,Sub_metering_2, col="red")
  lines(datetime,Sub_metering_3, col="blue")
})
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)

dev.off()
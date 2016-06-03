data<-read.table("household_power_consumption.txt",sep=";",nrows = 69517,skip = 66637,colClasses="character")[1:2880,]
colnames(data)<-colnames(read.table("household_power_consumption.txt",sep=";",nrows = 1,header=TRUE))
data$Date<-as.Date(data$Date, "%d/%m/%Y")

library(dplyr)

data<-mutate(data,datetime=as.numeric(strptime(paste(as.character(data$Date),as.character(data$Time)), format = "%Y-%m-%d %H:%M:%S")))

png(filename="plot2.png",width = 480, height = 480)

#plotting

with(data,plot(datetime,Global_active_power,xaxt="n",xlab = "",ylab = "Global Active Power (kilowatts)",type =  "l"))
axis.POSIXct(1, data$Date, format="%a")

dev.off()
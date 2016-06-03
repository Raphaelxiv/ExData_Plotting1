data<-read.table("household_power_consumption.txt",sep=";",nrows = 69517,skip = 66637,colClasses="character")[1:2880,]
colnames(data)<-colnames(read.table("household_power_consumption.txt",sep=";",nrows = 1,header=TRUE))
data$Date<-as.Date(data$Date, "%d/%m/%Y")

png(filename="plot1.png",width = 480, height = 480)

#plotting

hist(as.numeric(data$Global_active_power),col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
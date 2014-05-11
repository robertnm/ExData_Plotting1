# require("sqldf")
# housefile <- "./household_power_consumption.txt"
#select only the dates on interest to load 
# query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
# dat <- read.csv2.sql(housefile,query)

# write the subset to a separate file to speed up later reads
smallfile <- "./house_pwr_2day.csv"
#write.csv(dat,smallfile)
# if we've already created the small file, read from that, as it is much faster
dat <- read.csv(smallfile)
dat$datetime <- strptime(paste(dat$Date, dat$Time),"%d/%m/%Y %H:%M:%S")

makeplotA <- function() {
  plot(dat$datetime,dat$Global_active_power,type='l',
       ylab='Global Active Power',xlab='') 
}

makeplotB <- function() {
  plot(dat$datetime,dat$Sub_metering_1,type='l',col='black',
       ylab='Energy sub metering',xlab='')
  lines(dat$datetime,dat$Sub_metering_2,type='l',col='red')
  lines(dat$datetime,dat$Sub_metering_3,type='l',col='blue')
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c('black','red','blue'),lty=1,bty="n",cex=0.8) 
}

makeplotC <- function() {
  plot(dat$datetime,dat$Voltage,type='l',
       ylab='Voltage',xlab='datetime') 
}

makeplotD <- function() {
  plot(dat$datetime,dat$Global_reactive_power,type='l',
       ylab='Global_reactive_power',xlab='datetime') 
}

par(mfcol=c(2,2))
makeplotA()
makeplotB()
makeplotC()
makeplotD()

png(file = "./plot4.png")
par(mfcol=c(2,2))
makeplotA()
makeplotB()
makeplotC()
makeplotD()
dev.off()
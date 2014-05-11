#require("sqldf")
#housefile <- "./household_power_consumption.txt"
#select only the dates on interest to load 
#query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
#dat <- read.csv2.sql(housefile,query)

# write the subset to a separate file to speed up later reads
smallfile <- "./house_pwr_2day.csv"
#write.csv(dat,smallfile)
# if we've already created the small file, read from that, as it is much faster
dat <- read.csv(smallfile)
dat$datetime <- strptime(paste(dat$Date, dat$Time),"%d/%m/%Y %H:%M:%S")

makeplot <- function() {
  plot(dat$datetime,dat$Global_active_power,type='l',
       ylab='Global Active Power (kilowatts)',xlab='')

  }

makeplot()

png(file = "./plot2.png")
makeplot()
dev.off()
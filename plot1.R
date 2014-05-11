require("sqldf")
housefile <- "./household_power_consumption.txt"
#select only the dates on interest to load 
query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
dat <- read.csv2.sql(housefile,query)

# write the subset to a separate file to speed up later reads
smallfile <- "./house_pwr_2day.csv"
write.csv(dat,smallfile)
# if we've already created the small file, read from that, as it is much faster
# dat <- read.csv(smallfile)

hist(dat$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

png(file = "./plot1.png")
hist(dat$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()
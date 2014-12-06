## generate plot1

# get data
source("download_data.R")
data <- get_data()

# generate histogram
png("plot1.png", width = 480, height = 480)
with(data, hist(
  Global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  col = "red"
))
dev.off()

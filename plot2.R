## generate plot1

# get data
source("download_data.R")
data <- get_data()

# generate graph
png("plot2.png", width = 480, height = 480)
plot(
  data$DateTime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)
dev.off()

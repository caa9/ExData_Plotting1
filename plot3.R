## generate plot3

# get data
source("download_data.R")
data <- get_data()

# generate graph
png("plot3.png", width = 480, height = 480)
with(data,  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = ""))
with(data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
title(ylab = "Energy sub metering")
legend(
  "topright",
  names(data)[5:7],
  lty = "solid",
  col = c("black", "red", "blue")
)
dev.off()

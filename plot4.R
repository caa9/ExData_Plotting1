## generate plot4

# get data
source("download_data.R")
data <- get_data()

# generate graph
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(data, {
  # upper left graph
  with(data, plot(
    DateTime,
    Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power"
  ))
  # bottom left graph
  with(data, {
     plot(DateTime, Sub_metering_1, type = "l", col = "black", ann = FALSE)
    lines(DateTime, Sub_metering_2, type = "l", col = "red")
    lines(DateTime, Sub_metering_3, type = "l", col = "blue")
})
  title(ylab = "Energy sub metering")
  legend(
    "topright",
    names(data)[5:7],
    cex = 0.9,
    bty = "n",
    lty = "solid",
    col = c("black", "red", "blue")
  )
  # upper right graph
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # bottom right graph
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")  
})
dev.off()

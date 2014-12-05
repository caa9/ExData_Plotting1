## generate plot4

# get data
#source("download_data.R")
#data <- get_data()

# generate graph
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
  # TODO: insert plot2 here
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # TODO: insert plot3 here
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")  
})
dev.off()

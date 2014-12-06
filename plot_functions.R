make_plot1 <- function(data) {
  with(data, hist(
    x = Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    col = "red"
  ))
}

make_plot2 <- function(data) {
  with(data, plot(
    DateTime,
    Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
  ))
}

make_plot3 <- function(data) {
  with(data, plot(
    DateTime, Sub_metering_1, type = "l", col = 1, xlab = "", ylab = ""
  ))
  with(data, lines(DateTime, Sub_metering_2, type = "l", col = 2))
  with(data, lines(DateTime, Sub_metering_3, type = "l", col = 4))
  legend("topright", names(data)[5:7], lty="solid", col=c(1, 2, 4), cex=0.9)
  title(ylab = "Energy sub metering")
}

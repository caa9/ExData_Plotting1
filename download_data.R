get_data <- function() {
  ## download and tidy data in preparation for plots
  
  # data settings
  data_file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  data_dir <- "data"
  data_file_name <- paste(data_dir, "household_power_consumption.zip", sep="/")
  
  # prepare download location
  if (!file.exists(data_dir)) {
    dir.create(data_dir)
  }
  
  # get data if necessary
  if (!file.exists(data_file_name)) {
    download.file(data_file_url, destfile = data_file_name, method = "curl")
    unzip(data_file_name, exdir=data_dir, overwrite = TRUE)
  }
  
  # read data
  library(data.table)
  data_file_name <- paste(data_dir, unzip(data_file_name, list = TRUE)[[1]], sep = "/")  
  dt <- fread(data_file_name, na.strings = c("NA", "N/A", "", "?"))
  
  # only use what's needed
  data <- dt[dt$Date == "1/2/2007" | dt$Date == "2/2/2007"]
  rm(dt)
  
  # clean up
  data$Global_active_power    <- as.numeric(data$Global_active_power)
  data$Global_reactive_power  <- as.numeric(data$Global_reactive_power)
  data$Voltage                <- as.numeric(data$Voltage)
  data$Global_intensity       <- as.numeric(data$Global_intensity)
  data$Sub_metering_1         <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2         <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3         <- as.numeric(data$Sub_metering_3)
  data$Date                   <- as.Date(data$Date, format = "%d/%m/%Y")
  data$DateTime               <- as.POSIXct(strptime(
                                   paste(data$Date, data$Time, sep = " "),
                                   format = "%F %T"
                                 ))
  data$Date                   <- NULL
  data$Time                   <- NULL
  
  return(data)
}

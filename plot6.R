#load the data file
NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

#create plot 6
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
      geom_line() +
      geom_point() +
      ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
      labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
      scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
      theme(legend.title = element_text(face = "bold"))


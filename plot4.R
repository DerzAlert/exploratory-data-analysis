#load the data file
NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

#create plot 4
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
      geom_line() +
      geom_point() +
      ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
      xlab("Year") +
      ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
      scale_colour_discrete(name = "Type of sources") +
      theme(legend.title = element_text(face = "bold"))

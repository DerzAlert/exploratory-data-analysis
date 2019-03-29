# load the data file

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change into data.table

NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)


# create plot 1
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(total.emissions, type = "b", pch = 18, col = "green", ylab = "Emissions", 
    xlab = "Year", main = "Annual Emissions")
    
    # print
dev.off()


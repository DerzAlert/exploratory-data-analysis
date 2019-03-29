#load the data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#create plot 2
balt <- NEI[which(NEI$fips == 24510),]
tbal <- aggregate(Emissions ~ year,balt, sum)

barplot(tbal$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "Baltimore PM2.5 Emission Totals", names.arg = tbal$year)

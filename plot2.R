###Q2
###Have total emissions from PM2.5 decreased in the Baltimore City, 
###Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") 
###from 1999 to 2008? Use the base plotting system to make a plot answering this question.

####Step 1: Initialise

setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(dplyr)

####Step 2: Load Data

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))

####Step 3: filter on Baltimore, group by year and sum emissions

c<- subset(filter(nei,fips == 24510) %>% group_by(year) %>% summarise(x = sum(Emissions)))

####Step 4: Plot and print

png("plot2.png", width=480, height=480) #open the png ploting
plot(c$year, c$x, type="l", main = "Baltimore Emissions per Year", xlab="Year", ylab="Baltimore Emmisions PM.25 (tons)", col="red")
dev.off() #close Plot

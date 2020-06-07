setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(lubridate)
library(dplyr)
library(ggplot2)
##Q1
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using 
##the base plotting system, make a plot showing the total PM2.5 emission from all 
##sources for each of the years 1999, 2002, 2005, and 2008.

###Step 1

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))

###Step 2: create the subset and group by year and sum emmissions per year

c<- subset(nei, nei$year %in% 1999| 2002| 2005 | 2008) %>% group_by(year) %>% summarise(x = sum(Emissions))

###Step 3: plot graph

b<-max(c$x)
b

plot(c$year, c$x, type="l", main = "Emissions per Year", xlab="Year", ylab="Emmisions PM.25 (tons)", ylim = c(0, max(c$x)))

png("plot2.png", width=480, height=480) #open the png ploting

dev.off() #close Plot
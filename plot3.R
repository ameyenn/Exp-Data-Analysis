####Q3 Of the four types of sources indicated by the \color{red}{\verb|type|}
####type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
####have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?
####Use the ggplot2 plotting system to make a plot answer this question.

####Step 1: Initialise

setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(dplyr)
library(ggplot2)

####Step 2: Load Data

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))

####Step 3: Group by type and year, filter Baltimore and sum Emissions

c<- subset(filter(nei,fips == 24510) %>% group_by(type, year) %>% summarise(x = sum(Emissions)))

#####Step 4: Create plot and print to PNG

plot<-ggplot(data = c, aes(x = year, y = x, color=type)) +    #create main data plot
  geom_line()
p<-plot + ggtitle("Baltimore Emissions by type and year") +   #add the heading and lables
  xlab("Year") + ylab("Emissions")

png("plot3.png", width=480, height=480)                       #open the png ploting
  p
dev.off()                                                     #close Plot



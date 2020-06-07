####Q5 How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

####Step 1: Initialise

setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(dplyr)
library(ggplot2)

####Step 2: Load Data

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))
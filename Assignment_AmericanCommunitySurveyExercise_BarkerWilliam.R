# Assignemnt: American Community Survey Exercise
# Name: Barker, William
# Date: 12/19/2021

Community_Survey <- read.csv("C:/Users/wcb14/OneDrive/Desktop/williamcbarker/dsc520/data/acs-14-1yr-s0201.csv")

# The elements in the datat set are: 
# Id: Character Data
# Id2: Numeric Data
# Geography: Character Data
# PopGroupID: Numeric Data
# POPGROUP.display-label: Character Data
# Races Reported: Numeric Data
# HSDegree: Numeric Data
# BachDegree: Numeric Data

str(Community_Survey)
nrow(Community_Survey)
ncol(Community_Survey)

install.packages("ggplot2")

library(ggplot2)
theme_set(theme_minimal())

ggplot(Community_Survey, aes(HSDegree)) + geom_histogram(bins = 10) + 
  ggtitle("High School Degrees") + xlab("Percentage with HS Degrees") + 
  ylab("Percentage with Bachelors")

# Based on what I can see the data is unimodel
# It does not appear to be symmetrical
# It is bell shaped
# It does not appear to be a normal distribution
# It appears to be right skewed
ggplot(Community_Survey, aes(HSDegree)) + geom_histogram(bins = 10, aes(y = ..density..)) + 
  stat_function(fun = dnorm, args = list(mean = mean(Community_Survey$HSDegree),
                                         sd = sd(Community_Survey$HSDegree)),
                col = "#1b98e0",
                size = 5) +
  ggtitle("High School Degrees") + xlab("Percentage with HS Degrees") + 
  ylab("Percentage with Bachelors")
# I suppose a normal distribution can be used as a model for this data because 
# the data follows the path of the curve.

install.packages("qqplotr")
library(qqplotr)

ggplot(Community_Survey, mapping = aes(sample = HSDegree)) + 
  stat_qq_point(size = 2, color = "blue") + stat_qq_line(color = "red")
  
# Based on the probability chart I would say the distribution is normal
# because the majority of the chart falls on the normal distribution chart

install.packages("pastecs")
library(pastecs)

stat.desc(Community_Survey)

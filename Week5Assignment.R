# Assignment: Week 5 Assignment
# Name: Barker, William
# Date: 1/16/2022

setwd("F:/Github Repository/williamcbarker/dsc520")

scorescsv <- read.csv("data/scores.csv")

housing <- read.csv("data/acs-14-1yr-s0201.csv")

install.packages("dplyr")

library(dplyr)
# using the select operation to select 3 columns
select(housing, Geography, RacesReported)
# using the filter operation to show races reported below 1 million
housing %>% filter(RacesReported <= 1000000)
# using the select and mutate operations to show the city and a sample of races reported
housing %>% select(Geography, RacesReported) %>% mutate(sampleR=RacesReported/10)
# using the summerize operation to show the average races reported
housing %>% summarize(mean(RacesReported))
# using the group_by operation to to group a sample of races reported by city
housing %>% group_by(Geography) %>% summarize(sampleR=RacesReported/100)
# using the arrange operation to sort the reults by the sample of races reported
housing %>% group_by(Geography) %>% summarize(sampleR=RacesReported/100) %>%
  arrange(sampleR)

install.packages("purrr")

library(purrr)
# using the mean function
housing %>% map_dbl(mean)
# using the median function
housing %>% map_dbl(median)
# creating a new data frame of just HS Degrees over 86.6
HSDegree <- housing %>% select(HSDegree) %>% filter(HSDegree > 86.6)
# creating a new data frame of just Bach Degress over 30
BachDegree <- housing %>% select(BachDegree) %>% filter(BachDegree > 30)
# using the cbind function to combine the data frames
Degrees <- cbind(HSDegree, BachDegree)

Degrees
# creating a new data frame of just HS Degrees under or equal to 86.6
HSDegree2 <- housing %>% select(HSDegree) %>% filter(HSDegree <= 86.6)
# creating a new data frame of just Bach Degress under or equal to 30
BachDegree2 <- housing %>% select(BachDegree) %>% filter(BachDegree <= 30)
# using the cbind function to combine the data frames
Degrees2 <- cbind(HSDegree2, BachDegree2)

Degrees2
# using the rbind function to combine the dat frames
Degrees3 <- rbind(Degrees, Degrees2)

Degrees3

install.packages("stringr")

library(stringr)
# splitting the string of cities and states from the data from on the comma
Geography <- str_split(string=housing$Geography, pattern = ",")

Geography
# converting the split strings into a data frame
geoMatrix <- data.frame(Reduce(rbind, Geography))

geoMatrix
# concatenating the split strings back together seperated by a comma
Geography2 <- paste(geoMatrix$X1, ",", geoMatrix$X2)

Geography2






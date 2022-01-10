# Assignment: Week 4 Assignment
# Name: Barker, William
# Date: 1/9/2022


install.packages("ggplot2")

library(ggplot2)
theme_set(theme_minimal())

setwd("/Seagate Portable Drive (F:)/Github Repository/williamcbarker/dsc520")

scorescsv <- read.csv("data/scores.csv")

install.packages("plyr")

library(plyr)

arrange(scorescsv, desc(Score))

install.packages("data.table")

library(data.table)

install.packages("dplyr")

library(dplyr)
# Part 3 of question 1
# new data set of just the regular section
scores_regular <- filter(scorescsv, Section=="Regular")

scores_regular
# new data set of just the sports section
scores_sports <- filter(scorescsv, Section=="Sports")

scores_sports

scores_regular <- tibble::rownames_to_column(scores_regular, var="Student")

scores_regular

scores_sports <- tibble::rownames_to_column(scores_sports, var="Student")

scores_sports

ggplot(scores_regular, aes(x=Score, y=Student)) + geom_point()

ggplot(scores_sports, aes(x=Score, y=Student)) + geom_point()

ggplot(scores_regular, aes(Score)) + geom_histogram(bins = 50) + 
  ggtitle("Regular Scores") + xlab("Scores") + ylab("Number of Students with Score")


ggplot(scores_sports, aes(Score)) + geom_histogram(bins = 50)+ 
  ggtitle("Sports Scores") + xlab("Scores") + ylab("Number of Students with Score")

summarise(scores_regular, avg=mean(Score))
summarise(scores_sports, avg=mean(Score))
summarise(scores_regular, med=median(Score))
summarise(scores_sports, med=median(Score))

#Beginning of question 2
#using the apply function
apply(acs_14_1yr_s0201[, c(7, 8)], 1, sum)

#using the aggregate function
aggregate(x=acs_14_1yr_s0201$RacesReported, by=list(acs_14_1yr_s0201$Geography), FUN = mean)
#using the transmute function to remove a column and add 1 to it
new <- transmute(acs_14_1yr_s0201, Bach2=BachDegree+1)
#re-adding the colomn to the data set
acs_14_1yr_s0201$new <- new

acs_14_1yr_s0201
#check for outliers
summary(acs_14_1yr_s0201$HSDegree) #no clear outliers
summary(acs_14_1yr_s0201$BachDegree) #no clear outliers
#create 2 new variables
acs_14_1yr_s0201 <- mutate(acs_14_1yr_s0201, HSDegree2=HSDegree+1)
acs_14_1yr_s0201 <- mutate(acs_14_1yr_s0201, RacesReported2=RacesReported/2)

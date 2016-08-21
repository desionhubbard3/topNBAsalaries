library(ggplot2)
library(dplyr)



setwd("C:\\Users\\Mommy & Daddy\\Desktop\\Data Science Projects\\20160818 NBA Salary Data\\2. Prepared Data")
getwd()
rm(stats) 
salarystats<- read.csv("nba_top_salary_stats.csv",row.names = NULL)
salarystats



#verify that all columns and rows have been imported 
ncol(salarystats)   #31
nrow(salarystats)   #107

#Now That The Data Is Loaded We Will Check The Structure of The Rows
head(salarystats)
str(salarystats)
summary(salarystats)


#Lets Delete The Unncessary Column. We'll Use head() to scope them out
head(salarystats)

#remove the columns League(Lg) and Team(Tm). Both are unneccesary
salarystats$Tm <- NULL
salarystats$Lg <- NULL

#Re-Count Columns
ncol(salarystats) # 29 columns
salarystats[salarystats=="CarmeloAnthony"]

#Rename columns
colnames(salarystats) <-c("Season","Player", "Salary","Position","Games","GamesStarted","MinutesPlayed","FieldGoal","FieldGoalAttempts","FieldGoalPercent","3-PointFG",
                          "3-PointFGAttempts","3-PointPercent","2-PointFG","2-PointFGAttempts","2-PointFGPercent","EffectiveFG","FreeThrows","FreeThrowAttempts","FreeThrowPercent",
                          "OffensiveRebounds","DefensiveRebounds","TotalRebounds","Assists","Steals","Blocks","Turnovers","PersonalFouls","Points")

#verify name change
colnames(salarystats)



#Derrick Rose Did Not Play The 2012-13 Season and "Did Not Play" Is Showing Up 
#In Several Cells. We will Take Out The "Did Not Play" In Those Cells
salarystats[salarystats=="Did Not Play"]<-"0"

#verify that the "Did Not Play" was removed from row 94 
tail(salarystats,15)


#Majority of columns need to be changed from a factor to an integer
salarystats$GamesStarted <-as.integer(salarystats$GamesStarted)
salarystats$MinutesPlayed <-as.integer(salarystats$MinutesPlayed)
salarystats$FieldGoal <-as.integer(salarystats$FieldGoal)
salarystats$FieldGoalAttempts <-as.integer(salarystats$FieldGoalAttempts)
salarystats$FieldGoalPercent <-as.integer(salarystats$FieldGoalPercent)
salarystats$`3-PointFG` <-as.integer(salarystats$`3-PointFG`)
salarystats$`3-PointFGAttempts` <-as.integer(salarystats$`3-PointFGAttempts`)
salarystats$`3-PointPercent` <-as.integer(salarystats$`3-PointPercent`)
salarystats$`2-PointFG` <-as.integer(salarystats$`2-PointFG`)
salarystats$`2-PointFGAttempts` <-as.integer(salarystats$`2-PointFGAttempts`)
salarystats$`2-PointFGPercent` <-as.integer(salarystats$`2-PointFGPercent`)
salarystats$EffectiveFG <-as.integer(salarystats$EffectiveFG)
salarystats$FreeThrows <-as.integer(salarystats$FreeThrows)
salarystats$FreeThrowAttempts <-as.integer(salarystats$FreeThrowAttempts)
salarystats$FreeThrowPercent <-as.integer(salarystats$FreeThrowPercent)
salarystats$OffensiveRebounds <-as.integer(salarystats$OffensiveRebounds)
salarystats$DefensiveRebounds <-as.integer(salarystats$DefensiveRebounds)
salarystats$TotalRebounds <-as.integer(salarystats$TotalRebounds)
salarystats$Assists <-as.integer(salarystats$Assists)
salarystats$Steals<-as.integer(salarystats$Steals)
salarystats$Blocks<-as.integer(salarystats$Blocks)
salarystats$Turnovers<-as.integer(salarystats$Turnovers)
salarystats$PersonalFouls<-as.integer(salarystats$PersonalFouls)
salarystats$Points<-as.integer(salarystats$Points)
salarystats$Salary<-as.integer(salarystats$Salary)

## Dhyan Shah - 47998760
## Live Session Unit 03 assignment
## MSDS 6306-402

## Question 1 - GitHub Cloning ##

## setwd("~/Desktop/DoingDataScience/Unit3/HW3_2"
## git clone https://github.com/awesomedata/awesome-public-datasets.git
## ls
## cd 


## Question 2 - Data Summary ##
    ## a. 

      
df <- read.csv("titanic.csv")
str(df)
head(df)
summary(df)
print(df)


is.data.frame(df)

print(df$Sex)
summary(df$Sex)

fem <- subset(df, df$Sex == "female")
print(fem)

mel <- subset(df, df$Sex == "male")
print(mel)

barplot(table(df$Sex), xlab="Sex", ylab="Frequency", main="Titanic Passanger Gender Frequency", col="violet")
  ## b. 

table(df$Sex)
table(df$Age)
table(df$Fare)
table(df$Survived)
table(df$Survived, df$Age)
table(df$Survived, df$Age, df$Sex)
table(df$Pclass, df$Survived)

  ## c.

sapply(df, class)
tapply(df$Age, df$Fare, mean, is.na = TRUE)
tapply(df$Survived, df$Age, mean, is.na = TRUE)
tapply(df$Survived, df$Fare, mean, is.na = TRUE)

## Question 3 - Function Building 
read.csv("sleep_data_01.csv")
fb <- read.csv("sleep_data_01.csv")
str(fb)


  ## a. 
table(fb$Age)
Med_Age <- median(table(fb$Age))
print(Med_Age)

table(fb$Duration)
Min_Dur <- min(table(fb$Duration))
print(Min_Dur)

Max_Dur <- max(table(fb$Duration))
print(Max_Dur)

Mean_RSES <- mean(table(fb$RSES))
print(Mean_RSES)

sd_RSES <- sd(table(fb$RSES))
print(sd_RSES)

tapply(fb$Age, fb$RSES, mean, is.na = TRUE)
tapply(fb$Age, fb$Duration, mean, is.na = TRUE)
tapply(fb$Age, fb$RSES, sd, na.rm = FALSE)

  ## b. 
## Range 
table(fb$Duration)
ran_duration <- range(table(fb$Duration))
r_duration <- (max(ran_duration) - min(ran_duration))
print(r_duration)

xdf <- c(Med_Age, Mean_RSES/5, sd_RSES/5)
print(xdf)

ydf <- c(xdf, r_duration)
print(ydf)

## report <- data.frame(xdf, ydf)

report <- data.frame(Med_Age, Mean_RSES/5, 
                     sd_RSES/5, 
                     r_duration)
print(report)


  ## c. change the column name of data frame to MedianAge, SelfEsteem, SE_SD, and DurationRange.
report <- data.frame(MedianAge=Med_Age, SelfEsteem=Mean_RSES, SE_SD=sd_RSES, DurationRange=r_duration)
print(report) 
 ## d. round the report to at most 2 digit. 
round(report, digits = 2)
  ## e. run function on sleep data (sleep_data01.csv), show output 


## Question 4 - FiveThirtyEight Data

## HW3_2 Dhyan$ git clone https://github.com/rudeboybert/fivethirtyeight


install.packages("fivethirtyeight")
data(package = "fivethirtyeight")
library(fivethirtyeight)
data(college_recent_grads)
head(college_recent_grads)
View(college_recent_grads)
df <- college_recent_grads
dim(df)
??college_recent_grads
## https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/

colnames (df, do.NULL = FALSE, prefix = "col")




## Question 5 - Data Summary

  ## 5.a. Column Names, Column Counts 
colnames (df, do.NULL = FALSE, prefix = "col")
ncol(df)

## 5.b. count each unique major_category, 
major_count <- count(df$major_category)

library(plyr)
major_count<- count(df$major_category)
print(major_count)

## Reference for 5.b. 
  ## https://www.tutorialspoint.com
  ## https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf
  ## https://stackoverflow.com
  ## RStudio Help
  ## Noelle Brown :) THANK YOU!!

## 5.c. Barplot 
library(ggplot2)

ggplot(data=major_count, aes(x=major_count$x, y=major_count$freq, xlab = "Frequncy", ylab = "Majors", ,main = "Number of Majors"))+geom_bar(stat = "identity", col = "yellow")+coord_flip()

## 5.d. write fivethirtyeight data to a csv file. 
zf <- data.frame(college_recent_grads)
write.table(zf, file="collegerecentgrads.csv", sep=",", row.names = FALSE, quote = FALSE)


## Question 6 - Codebook

## http://github.com/dhyanshah/SMU_MSDS_6306_HW/README.md


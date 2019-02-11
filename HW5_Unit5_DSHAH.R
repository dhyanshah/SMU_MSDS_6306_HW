## Question 1 : File import, Data tidying.

Baby_Name <- read.delim("yob2016.txt", header = FALSE, sep = ";")
Baby_Name
Baby_Name <- data.frame(Baby_Name)
summary(Baby_Name)
str(Baby_Name)
head(Baby_Name)
tail(Baby_Name)

colnames(Baby_Name) <- c("FirstName", "Gender", "Frequency")

grep("yyy$", Baby_Name$FirstName, value = TRUE)
grep("^Fio", Baby_Name$FirstName, value = TRUE)

y2016 <- subset (Baby_Name, FirstName != "Fionayyy")
grep("yyy$", y2016$FirstName, value = TRUE)
summary(y2016)

## Question 2 : Data wrangling

Babies_Name <- read.delim("yob2015.txt", header = FALSE, sep = ",")
Babies_Name
summary(Babies_Name)
str(Babies_Name)
head(Babies_Name)
tail(Babies_Name)
colnames(Babies_Name) <- c("FirstName", "Gender", "Frequency")
y2015 <- data.frame(Babies_Name)
y2015_L10 <- tail(y2015, 10)
y2015_L10
## Interesting 1. All records have 5 frequency. 2. All records have same gender "M" 3. All records 
## have 2nd character VOWEL, as "y" being sixth VOWEL

final <- merge(y2016, y2015, by = "FirstName")
head(final)
summary(final)
final[!complete.cases(final),]

##Question 3 - Data analysis and storing results to file. 
final$Total <- final$Frequency.x + final$Frequency.y
head(final)


popular2015 <- y2015[y2015$Frequency == max(y2015$Frequency),]
popular2015

popular2016 <- y2016[y2016$Frequency == max(y2016$Frequency),]
popular2016
final_df <- data.frame(final)
final_df


top_10 <- final_df[with(final_df, order(-final_df$Total)), ] 

top_10

head(top_10,10)

top_girls <- subset (top_10, Gender.x != "M")
top_girls <- subset (top_10, Gender.y != "M")
top_girls$Gender.x <- NULL
top_girls$Gender.y <- NULL
top_girls$Frequency.x <- NULL
top_girls$Frequency.y <- NULL
popular_girls<- head(top_girls,10)
write.csv(popular_girls, file = "PopularGirls.csv", row.names = FALSE, na="")
df <- read.csv("PopularGirls.csv")
df

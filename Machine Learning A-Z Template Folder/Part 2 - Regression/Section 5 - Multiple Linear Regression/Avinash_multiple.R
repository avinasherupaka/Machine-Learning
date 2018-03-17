# Importing data set
data_set = read.csv('50_Startups.csv')_

#Taking care of missing data from observations
data_set$Age = ifelse(is.na(data_set$Age), 
                      ave(data_set$Age, FUN = function(x) mean(x,na.rm = TRUE)), 
                      data_set$Age)

data_set$Salary = ifelse(is.na(data_set$Salary), 
                         ave(data_set$Salary, FUN = function(x) mean(x,na.rm = TRUE)), 
                         data_set$Salary)

#Encoding categorical data
data_set$Country = factor(data_set$Country,
                          levels = c('France', 'Spain', 'Germany'),
                          labels = c(1, 2, 3))

data_set$Purchased = factor(data_set$Purchased,
                            levels = c('Yes', 'No'),
                            labels = c(1, 0))

# Splitting the data in to Training set and Test Set
# installed.packages('caTools')
# library(caTools)
set.seed(123)
split = sample.split(data_set$Purchased, SplitRatio = 0.8)
training_set = subset(data_set, split ==TRUE)
test_set = subset(data_set, split ==FALSE)
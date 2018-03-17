# Importing data set
data_set = read.csv('50_Startups.csv')

#Encoding categorical data
data_set$State = factor(data_set$State,
                          levels = c('New York', 'California', 'Florida'),
                          labels = c(1, 2, 3))

# Splitting the data in to Training set and Test Set
# installed.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data_set$Profit, SplitRatio = 0.8)
training_set = subset(data_set, split ==TRUE)
test_set = subset(data_set, split ==FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend, 
               data =  training_set)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

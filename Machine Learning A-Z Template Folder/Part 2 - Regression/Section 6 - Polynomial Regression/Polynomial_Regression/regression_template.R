# Importing data set
data_set = read.csv('Position_Salaries.csv')
data_set = data_set[2:3]

# Splitting the data in to Training set and Test Set
# installed.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(data_set$Salary, SplitRatio = 2/3)
# training_set = subset(data_set, split ==TRUE)
# test_set = subset(data_set, split ==FALSE)

# "Scaling your features".
# training_set[, 2:3] =  scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])


# Fitting Regression to the Training set
# Create your Regressor

# Predicting Regression Model result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualize Polynomial Regression Model
ggplot() + 
  geom_point(aes(x = data_set$Level, y = data_set$Salary),
             colour = 'red') +
  geom_line(aes(x = data_set$Level, y = predict(regressor, newdata = data_set)),
            colour = 'green') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')

# Visualize Polynomial Regression Model(High resolution and smooth curve)
x_grid = seq(min(data_set$Level, max(data_set$Level), 0.1))
ggplot() + 
  geom_point(aes(x = data_set$Level, y = data_set$Salary),
             colour = 'red') +
  geom_line((aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid)),
            colour = 'green') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')





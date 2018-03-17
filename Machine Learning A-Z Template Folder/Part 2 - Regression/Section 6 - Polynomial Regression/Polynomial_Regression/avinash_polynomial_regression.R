# Importing data set
data_set = read.csv('Position_Salaries.csv')
data_set = data_set[2:3]

# Fitting Linear Regression to the Training set
lin_regressor = lm(formula = Salary ~ ., 
                   data =  data_set)
summary(lin_regressor)

# Fitting Polynomial Regression to the Training set
data_set$Level2 = data_set$Level^2
data_set$Level3 = data_set$Level^3
data_set$Level4 = data_set$Level^4
poly_regressor = lm(formula = Salary ~ ., 
               data =  data_set)
summary(poly_regressor)

# Visualize Linear Regression Model
library(ggplot2)
ggplot() + 
  geom_point(aes(x = data_set$Level, y = data_set$Salary),
             colour = 'red') +
  geom_line(aes(x = data_set$Level, y = predict(lin_regressor, newdata = data_set)),
            colour = 'green') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualize Polynomial Regression Model
ggplot() + 
  geom_point(aes(x = data_set$Level, y = data_set$Salary),
             colour = 'red') +
  geom_line(aes(x = data_set$Level, y = predict(poly_regressor, newdata = data_set)),
            colour = 'green') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting Linear regression result
y_pred = predict(lin_regressor, data.frame(Level = 6.5))

# Predicting Polynomial Regression Model result
y_pred = predict(poly_regressor, data.frame(Level = 6.5,
                                            Level2 = 6.5^2,
                                            Level3 = 6.5^3,
                                            Level4 = 6.5^4))



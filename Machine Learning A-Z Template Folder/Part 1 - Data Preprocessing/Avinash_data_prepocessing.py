#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  2 11:31:26 2018

@author: aerup
"""
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Import the data set

data_set = pd.read_csv('Data.csv') 

X = data_set.iloc[:, :-1].values
Y = data_set.iloc[:, 3].values

#Taking care of missing data from observations

from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0)
# fit imputer object to matrix of data  X
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])

#Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelEncoder_X = LabelEncoder()
X[:, 0] = labelEncoder_X.fit_transform(X[:,0]) # this makes the column like this array([0, 2, 1, 2, 1, 0, 2, 0, 1, 0], dtype=object) 
#introducing order of precedence problem so we have to give all 3 variables equal value using OneHotEncoder
oneHotEncoder = OneHotEncoder(categorical_features = [0])
X = oneHotEncoder.fit_transform(X).toarray()

labelEncoder_Y = LabelEncoder()
Y = labelEncoder_Y.fit_transform(Y)

# Splitting the data in to Training set and Test Set
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0)

# "Scaling your features".( Euclidean Distance between features should be small. You can do that by Standardisation and Normalization)

from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)



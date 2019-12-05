#In order to load data.mat file in python
import scipy.io as sio
import numpy as np
from random import shuffle
from sklearn.model_selection import LeaveOneOut
from sklearn.model_selection import KFold
from sklearn import svm
from sklearn.model_selection import cross_val_score


#Loading the data
data = sio.loadmat("data.mat") 


#Take data part from the data.mat and shuffle it
my_data = data["data"]
shuffle(my_data)


#Train set
X = my_data[0,0][0]


#Target set
y = my_data[0,0][1]


#Flattening y
y = y.ravel()


#Defining method as KFold
method = KFold(n_splits=5)


method.get_n_splits(X)


#Training the model
for train_index, test_index in method.split(X):
    X_train, X_test = X[train_index], X[test_index]
    y_train, y_test = y[train_index], y[test_index]
    model = svm.SVC(gamma='scale')
    model.fit(X_train, y_train)


#5 folds
cross_val_score(model, X, y, cv = 5)


#10 folds
cross_val_score(model, X, y, cv = 10)


#LeaveOneOut
cross_val_score(model, X, y, cv = 42)


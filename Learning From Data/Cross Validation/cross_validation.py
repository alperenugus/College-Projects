#In order to load data.mat file in python
import scipy.io as sio
import numpy as np
from random import shuffle
from sklearn.model_selection import train_test_split
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


#Controlling the shapes
print(X.shape)
print(y.shape)


#Splitting %20 of the data for testing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state=0)


X_train.shape, y_train.shape

X_test.shape, y_test.shape


#Training with Support Vector Machine
clf = svm.SVC(kernel='linear', C=1).fit(X_train, y_train)


#The average of all folds
clf.score(X_test, y_test)    


#scores array that holds each training cycle's success rate
scores = cross_val_score(clf, X, y, cv=5)


scores


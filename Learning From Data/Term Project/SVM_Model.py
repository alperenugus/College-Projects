import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import Normalize
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_iris
from sklearn.model_selection import StratifiedShuffleSplit, StratifiedKFold
from sklearn.model_selection import GridSearchCV, RandomizedSearchCV
from sklearn.linear_model import Perceptron
from sklearn.metrics import accuracy_score
from sklearn.preprocessing import StandardScaler
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_classif
import numpy as np
import csv
from sklearn import preprocessing
from sklearn.decomposition import PCA
from sklearn.svm import SVC  
from sklearn.preprocessing import RobustScaler


def loadData(trainpath, testpath): # loads the data for training and testing
    dataset = []
    with open(trainpath, "r") as f:
        data = csv.reader(f, delimiter='\n')
        header = next(data)
        numberColumns = len(header)
        counter = 0
        for row in data:
            columns = list(row[0].split(','))
            newcolumns = []
            for number in columns:
                newcolumns.append(float(number))

            dataset.append(newcolumns)
            counter += 1
    
    dataset = np.asarray(dataset)
    ytrain = dataset[:,-1].astype(int) # takes the last column of train csv 
    Xtrain = dataset[:,:-1] # deletes the last column of the train array
    
    testset = []
    with open(testpath, "r") as f: # opens the file
        data = csv.reader(f, delimiter='\n')X
        header = next(data) # ignores the first line of the file
        numberColumns = len(header)
        counter = 0
        for row in data:
            columns = list(row[0].split(','))
            newcolumns = []
            for number in columns:
                newcolumns.append(float(number))

            testset.append(newcolumns)
            counter += 1
    
    testset = np.asarray(testset)
    
    return Xtrain, ytrain, testset


def load_new_test_set(filename): # a new function is written to only read the test file should another test file be used
	testset = []
	with open(filename, "r") as f:
		data = csv.reader(f, delimiter='\n')
		header = next(data)
		numberColumns = len(header)
		counter = 0
		for row in data:
			columns = list(row[0].split(','))
			newcolumns = []
			for number in columns:
				newcolumns.append(float(number))

			testset.append(newcolumns)
			counter += 1
    
	testset = np.asarray(testset)
	return testset


def processing(Xtrain, Xtest):  # processing function, it scales the data, normalizes it and performs features reduction.
    
    scaler = preprocessing.RobustScaler()
    scaler.fit(Xtrain)

    newXtrain = scaler.fit_transform(Xtrain)
    newXtest = scaler.transform(Xtest)

    X_norm_train = preprocessing.normalize(newXtrain, norm='l2')
    X_norm_test = preprocessing.normalize(newXtest, norm='l2')

    pca = PCA(n_components = 20)
    pca.fit(X_norm_train)

    newXtrain = pca.transform(X_norm_train)
    newXtest = pca.transform(X_norm_test)
    return newXtrain, newXtest, scaler, pca # scaler and pca are returned if a new test file is used,we can normalize scale and use pca.


def trainModel(Xtrain, ytrain):
    #this classifier is retrieved from grid searching, parameter tuning which is written below. 
    classifier = SVC(C=64, cache_size=200, class_weight=None, coef0=0.0,
  decision_function_shape='ovr', degree=3, gamma=0.0625, kernel='rbf',
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False)

    classifier.fit(Xtrain, ytrain)  
    return classifier


def predict(model, Xtest):    
    y_pred = model.predict(Xtest)  
    return y_pred


def writeOutput(filename, predictions): # writes the predictions to the selected csv file.
    with open(filename, 'w') as f:
	    f.write("ID,Predicted\n")
	    for i in range(len(predictions)):
	            writestr = str(i+1) + ','+ str(predictions[i]) + '\n'
	            f.write(writestr)
    f.close()


def predict_new_test_set(model,Xtest, scalerUsed, PCAUsed): # this function is used if a new test file is used. it scales, normalized
							    # and reduces the feature dimensionality of test set according to the training set.
	newXtest = scalerUsed.transform(Xtest)
	X_norm_test = preprocessing.normalize(newXtest, norm='l2')
	newXtest = PCAUsed.transform(X_norm_test)

	predictions = predict(model, newXtest)
	return predictions


def parameter_tuning(Xtrain, ytrain): # this function grid searches through C, gamma and linear, rbf or poly svm to find the best estimator.
	C = [2**(i) for i in range(-5,15)]
	gamma = [2**(i) for i in range(-15,3)]
	parameters = {'C':C, 'kernel':['poly', 'rbf', 'linear'], 'gamma':gamma}

	model = GridSearchCV(SVC(), param_grid=parameters, cv=StratifiedKFold(n_splits=5, random_state=None, shuffle=True))
	model.fit(Xtrain, ytrain)
	print( model.best_estimator_ )
	print( model.best_score_ )
	print( model.best_params_ )

	return model.best_params_ 


testFilename = 'test.csv'
trainFilename = 'train.csv'
outputFilename = 'Submission.csv'

Xtrain, ytrain, Xtest = loadData(trainFilename, testFilename) 

newXtrain, newXtest, scaler, pca = processing(Xtrain, Xtest)
model = trainModel(newXtrain, ytrain)
yPredicted = predict(model, newXtest)
writeOutput(outputFilename, yPredicted)

#parameter_tuning(newXtrain, ytrain)

#If new test set is used, uncomment the following block.

'''newTestFile = '' # add filename here
newTestOutput = 'NewSubmission.csv'
newTestSet = load_new_test_set(newTestFile)
preds = predict_new_test_set(model, newTestSet, scaler, pca)
writeOutput(newTestFile, preds)'''


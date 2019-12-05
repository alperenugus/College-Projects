#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import matplotlib.pyplot as plt
from random import randrange
from random import seed
learning_rate = 0.0001
num_iterations = 10000


# In[2]:


#Loading and normalizing data
data = np.loadtxt("regression_data.txt", skiprows = 1)
data = data/1000


# In[3]:


#Calculation of Mean Square Error sum[(Real-prediction)^2] / N
def computeMSE(b, m, data):
    totalError = 0
    for i in range(0, len(data)):
        totalError += (data[i][1] - (m * data[i][0] + b)) ** 2
    return totalError / float(len(data))


# In[4]:


def computeGradient(b, m, data, learning_rate):
    b_grad = 0
    m_grad = 0
    N = float(len(data))
    for i in range(0, len(data)):
        b_grad += -(2/N) * (data[i][1] - ((m*data[i][0]) + b))
        m_grad += -(2/N) * data[i][0] * (data[i][1] - ((m * data[i][0]) + b))
    updated_b = b - (learning_rate * b_grad)
    updated_m = m - (learning_rate * m_grad)
    return [updated_b, updated_m]


# In[5]:


# Split a dataset into k folds
def cross_validation_split(data, folds=5):
    data_split = list()
    data_copy = list(data)
    fold_size = int(len(data) / folds)
    for i in range(folds):
        fold = list()
        while len(fold) < fold_size:
            index = randrange(len(data_copy))
            fold.append(data_copy.pop(index))
        data_split.append(fold)
    return data_split


# In[6]:


def runForestrun(folds, errors, starting_b, starting_m, learning_rate, num_iterations):
    b = starting_b
    m = starting_m
    
    for i in range(len(folds)):
        for k in range(num_iterations):
            b,m = computeGradient(b, m, folds[i], learning_rate)
        errors.append(computeMSE(b, m, data))


# In[7]:


m_init = 0
b_init = 0
errors = []
fold_num = 5
folds = cross_validation_split(data, fold_num)
runForestrun(folds, errors, b_init, m_init, learning_rate, num_iterations)


# In[8]:


for i in range(fold_num):
    print("Error for fold" , i+1, " :" , errors[i])


# In[ ]:





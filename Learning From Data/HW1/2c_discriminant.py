#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import matplotlib.pyplot as plt
import math


# In[2]:


#Load data
data_train = np.loadtxt("classification_train.txt", skiprows = 1)


# In[3]:


c1_num = 0
c2_num = 0
#Split data into 4 arrays
c1_f1 = []
c1_f2 = []
c2_f1 = []
c2_f2 = []
for i in range(len(data_train)):
    if(data_train[i][2] == 0):
        c1_num += 1
        c1_f1.append(data_train[i][0])
        c1_f2.append(data_train[i][1])
    if(data_train[i][2] == 1):
        c2_num += 1
        c2_f1.append(data_train[i][0])
        c2_f2.append(data_train[i][1])


# In[4]:


#Probability Calculations
total_num = c1_num + c2_num
c1_prob = c1_num / total_num
c2_prob = c2_num / total_num


# In[5]:


def calc_mean(data):
    sum = 0
    for i in data:
        sum += i
    return sum / len(data)


# In[6]:


#Calculate means and create mean arrays for each class
c1_mean = []
c2_mean = []

c1_mean.append(calc_mean(c1_f1))
c1_mean.append(calc_mean(c1_f2))

c2_mean.append(calc_mean(c2_f1))
c2_mean.append(calc_mean(c2_f2))


# In[7]:


#Covarianca calculator function
def calc_cov(data_1 , data_2, mean_1, mean_2):
    if(len(data_1) != len(data_2)):
        return 0
    sum = 0
    for i, j in zip(data_1, data_2):
        sum += (i - mean_1) * (j-mean_2)
    sum /= len(data_1)
    return sum


# In[8]:


#Covariance matrix creator function
def cov_mat(f1, f2, m):
    return np.array([[calc_cov(f1, f1, m[0] , m[0]), calc_cov(f1, f2, m[0] , m[1])],
                     [calc_cov(f1, f2, m[0] , m[1]), calc_cov(f2, f2, m[1] , m[1])]])


# In[9]:


#Covariance matrices
c1_cov = cov_mat(c1_f1, c1_f2, c1_mean)
c2_cov = cov_mat(c2_f1, c2_f2, c2_mean)


# In[33]:


def discriminant(sample, means, cov, prob):
    cov_det = np.linalg.det(cov)
    cov_inv = np.linalg.inv(cov)
    result = -1/2 * np.dot(np.subtract(sample, means).transpose(),cov_inv) - 1/2 * math.log(cov_det) + math.log(prob)
    return result


# In[36]:


sample = []
sample.append(c1_f1[1])
sample.append(c1_f2[1])


# In[37]:


discriminant(sample , c1_mean, c1_cov, c1_prob)


# In[ ]:





# In[ ]:





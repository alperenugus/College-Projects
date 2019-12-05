#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import matplotlib.pyplot as plt
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


def runForestrun(data, starting_b, starting_m, learning_rate, num_iterations):
    b = starting_b
    m = starting_m
    for i in range(num_iterations):
        b,m = computeGradient(b, m, data, learning_rate)
    return [b,m]


# In[6]:


m_init = 0
b_init = 0

[b,m] = runForestrun(data, b_init, m_init, learning_rate, num_iterations)
error = computeMSE(b, m, data)


# In[7]:


x = data[:,0]
y_graph = m*x+b


# In[10]:


plt.plot(data[:,0] , y_graph, "y")
plt.plot(data[:,0] , data[:,1], "ro")
plt.xlabel('Head Size(cm^3)')
plt.ylabel('Brain Weight(grams)')
plt.show()


# In[11]:


print("My line equation: " , m , "* x + ",b)
print("MSE: " , error)


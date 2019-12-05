#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import matplotlib.pyplot as plt


# In[2]:


data_train = np.loadtxt("classification_train.txt", skiprows = 1)


# In[3]:


data_test = np.loadtxt("classification_test.txt", skiprows = 1)


# In[4]:


x = data_train[:,0]
y = data_train[:,1]


# In[5]:


plt.plot(x , y, "ro")
plt.xlabel('Feature #1')
plt.ylabel('Feature #2')
plt.show()


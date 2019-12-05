#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import matplotlib.pyplot as plt


# In[2]:


#Load data
data_train = np.loadtxt("classification_train.txt", skiprows = 1)


# In[3]:


c1_num = 0
c2_num = 0


# In[4]:


for i in range(len(data_train)):
    if(data_train[i][2] == 0):
        c1_num += 1
    if(data_train[i][2] == 1):
        c2_num += 1


# In[5]:


total_num = c1_num + c2_num


# In[6]:


c1_prob = c1_num / total_num


# In[7]:


c2_prob = c2_num / total_num


# In[8]:


c1_prob


# In[9]:


c2_prob


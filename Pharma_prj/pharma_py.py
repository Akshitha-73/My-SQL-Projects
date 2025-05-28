# -*- coding: utf-8 -*-
"""
Created on Wed May 28 16:20:06 2025

@author: akshi
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Dec 17 20:50:07 2024

@author: lenovo
"""

import pandas as pd

pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

project_data = pd.read_excel(r"C:/Users/akshi/Downloads/Pharma_prj/pharma_prj_dataset.xlsx")

project_data.info()
project_data.describe()
project_data.nunique()
project_data.isna().sum()
project_data.shape

project_data.duplicated().sum()
duplicate = project_data.duplicated()
duplicate

project_data = project_data.drop(columns=['Special Stock','Asset','Subnumber','Valuation Type','Smart Number','Sales Order','Customer','Sales Order.1','Network','Activity','WBS Element','Goods Receipt/Issue Slip','Multiple Account Assignment'])
project_data.head(5)
project_data.shape

project_data.dtypes

#Categorical Columns
mode = project_data.mode()

#-----------------------------------------------------------------------------------------------------------------
pd.options.display.float_format = '{:.12f}'.format

numerical_df = project_data.select_dtypes(include=['number'])
numerical_df.mean()
numerical_df.median()
numerical_df.mode()

numerical_df.var()
numerical_df.std()

range = numerical_df.max() - numerical_df.min()
range

numerical_df.max()
numerical_df.min()

numerical_df.skew()
numerical_df.kurt()

#-----------------------------------------------------------------------------------------------------------------

numerical_df.var() == 0

project_data = project_data.drop(columns=['Counter','Routing number for operations','Company Code','Ext. Amount in Local Currency','Sales Value','Sales Order Schedule','Sales Order Item','Sales order item','Sales Value inc. VAT','Original Line Item','Product Code','Vendor Code'])
project_data.head(5)
project_data.shape

#-----------------------------------------------------------------------------------------------------------------
#missing values

project_data = project_data.drop(columns=['Batch','Consumption','Receipt Indicator','Item automatically created','Product Description'])
project_data.head(5)
project_data.shape

#-----------------------------------------------------------------------------------------------------------------
#Graphical Representation
#TypeCasting

project_data.info()
project_data['Qty in Un. of Entry'] = pd.to_numeric(project_data['Qty in Un. of Entry'], errors='coerce')
project_data['Qty in OPUn'] = pd.to_numeric(project_data['Qty in OPUn'], errors='coerce')
project_data['Qty in order unit'] = pd.to_numeric(project_data['Qty in order unit'], errors='coerce')
project_data['Amount in LC'] = pd.to_numeric(project_data['Amount in LC'], errors='coerce')

project_data.dtypes
   
project_data['Posting Date'] = pd.to_datetime(project_data['Posting Date'], errors='coerce')
project_data['Entry Date'] = pd.to_datetime(project_data['Entry Date'], errors='coerce')
project_data['Time of Entry'] = pd.to_datetime(project_data['Time of Entry'], format='%I:%M:%S %p', errors='coerce')
project_data['Material Doc. Year'] = pd.to_datetime(project_data['Material Doc. Year'], format='%Y', errors='coerce')

project_data.dtypes

#Histogram

import matplotlib.pyplot as plt

plt.figure(figsize=(10,5))
plt.hist(project_data['Material'], bins=20, edgecolor='k')
plt.title('Histogram of Material')
plt.xlabel('Material')
plt.ylabel('Frequency')
plt.show()

numerical_df = project_data.select_dtypes(include=['number'])

for col in numerical_df:
    plt.figure(figsize=(10, 5))
    plt.hist(numerical_df[col], bins=20, edgecolor='k')
    plt.title(f'Histogram of {col}')
    plt.xlabel(col)
    plt.ylabel('Frequency')
    plt.show()

#-----------------------------------------------------------------------------------------------------------------
#Box Plot for Length Column
import seaborn as sns
 
plt.figure(figsize=(10, 6))
sns.boxplot(x=project_data['Material'])
plt.title('Box Plot of Material')
plt.xlabel('Material')
plt.grid()
plt.show()

numerical_df = project_data.select_dtypes(include=['number'])

#Box Plot for each column
for col in numerical_df:
    plt.figure(figsize=(10, 6))
    sns.boxplot(x = numerical_df[col])
    plt.title(f'Box Plot of {col}')
    plt.xlabel(col)
    plt.show()
#-----------------------------------------------------------------------------------------------------------------

import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns

# Q-Q Plot for each column
for col in numerical_df:
    plt.figure(figsize=(10, 6))
    stats.probplot(numerical_df[col].dropna(), dist="norm", plot=plt)
    plt.title(f'Q-Q Plot of {col}')
    plt.xlabel('Theoretical Quantiles')
    plt.ylabel('Sample Quantiles')
    plt.grid()
    plt.show()

# Density Plot for each column
for col in numerical_df:
    plt.figure(figsize=(10, 6))
    sns.kdeplot(data=numerical_df, x=col, fill=True, color="skyblue", alpha=0.5)
    plt.title(f'Density Plot of {col}')
    plt.xlabel(col)
    plt.ylabel('Density')
    plt.grid()
    plt.show()

#-----------------------------------------------------------------------------------------------------------------

df = project_data.to_csv('project_data.csv', index=False)
df
















#-----------------------------------------------------------------------------------------------------------------


















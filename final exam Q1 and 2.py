# -*- coding: utf-8 -*-
"""
Created on Mon Nov 30 23:35:43 2020

@author: Christine
"""
#%% Problem 1
num = []

for i in range(2000, 3201):
    if (i % 7 == 0) and (i % 5 != 0):
        num.append(i)
        
print(num)

#%% Problem 2 class
class upperString:
    def __init__(self):
        self.text = ""
        
    def getString(self):
        self.text = input("Enter text: ")
        
    def printString(self):
        if len(self.text) > 0:
            print(self.text.upper())
        else:
            print("Please enter text with getString")

#%% Problem 2 test strings            
#all upper case
a = upperString()
a.getString()
a.printString()

#all lower case
b = upperString()
b.getString()
b.printString()

#mix case
c = upperString()
c.getString()
c.printString()

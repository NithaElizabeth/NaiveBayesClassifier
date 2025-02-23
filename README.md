# NaiveBayesClassifier
This repo contains an implementation of Naive Bayes Algorithm from scratch without the use of any libraries or pre-defined function.
## Introduction
The aim of this project is to build a classifier to decide whether to play outside or not depending on the a set features that determines weather conditions.The data-set used for the experiments contain attributes such as "Outlook", "Temperature", "Humidity", "Windy". A Naive Bayes classifier assumes that the presence of a particular weather feature in a class is unrelated to the presence of any other weather feature. The Bayes’ Theorem evaluates the probability of an event occurring given the probability of another event that has already occurred. Bayes’ theorem is stated mathematically as the following equation: \
![1](https://user-images.githubusercontent.com/47361086/112357274-c9bf7080-8ce8-11eb-8c8c-c6e4b6ed35a5.PNG)
\
where c is a class variable and X is a feature vector.In this particular experiment,for example X = {overcast hot normal FALSE} and c = {CAN PLAY}.

## Methodology
The entire process was divided into three major tasks which are Data pre-processing, Building a naive Bayes classifier and Optimising the the classifier with Laplace smoothing.
### Task 1 : Data Pre-Processing
The data set used for this experiment contains 14 samples.The data set used here is multivariate categorical with four attributes (which are Outlook, Temperature, Humidity, Windy).The last column of the data-set represents the targeted value/level.In order to use the data-set with MATLAB, all the attribute values were converted into integers>=1. The attribute "Outlook" has three levels from 3-5, the attribute "Temperature" has three levels from 6-8, the attributes "Humidity" has two levels which are 9 & 10, and the attributes "Windy" has two levels which are 11 & 12.This is a binary classification problem and hence the "Target" column contains two levels : 1&2. After removing the row that indicates the levels in attributes, the data-set is split into Training set an Testing set. The training set contains 70% of the total number of observation and testing set contains the rest.The training set and testing set are chosen completely randomly.
### Task 2 : Building a Naive Bayes Classifier
The program is coded in MATLAB.The program has a main file (naive_main.m) and a function file (naive_classifier.m). The main file is used for pre-processing and executing the function files in this program.It is used for loading the data-set and extracting information about the size of the overall data-set.It also checks that none of the elements in the data set has a value below 1.If there are any values less than 1, then no further computation takes place with the same data-set. It also checks if the number of attributes in the testing set is at least equal to d (no of attributes in training set).If the condition is not satisfied, the program returns an error message. Once the necessary conditions are satisfied, the main file executes the function file (naive_classifier.m).The training and testing data-set, their size and the array indicating different levels in each attribute is passed while calling the function.
### Task 3 : Improve the classifier with Laplace Smoothing
The final posterior probability is calculated by taking the product of likelihood probabilities.But this approach is problematic when a frequency-based probability is zero, because it will wipe out all the information in the other probabilities, and the solution would not be optimal.A solution would be to incorporate Laplace smoothing (also called additive smoothing) , which is a technique for smoothing categorical data. A small-sample correction, or pseudo-count, will be introduced in every probability estimate. Consequently, no probability will be zero. For an experiment performed N times,the value i occurs ni times for a random variable x = {1,2,3....v} with v possible discrete values.The probability of observing i with Laplace Smoothing is : \
![2](https://user-images.githubusercontent.com/47361086/112359173-6f271400-8cea-11eb-9caf-aa917cd20e34.PNG)
\
This Laplace smoothing is introduced in the likelihood probabilities of both classes so as to ensure that no information is lost even if the frequency of observing a particular attribute is zero.
## Result
After testing the model, it was observed that the accuracy of the model was completely dependent on the data set chosen. When both training set and testing set were chosen randomly from the given data set,the mean accuracy obtained for 500 iterations was good enough (it varied from time to time). This case is shown in the below given Figure. \
![3](https://user-images.githubusercontent.com/47361086/112360043-53703d80-8ceb-11eb-8978-7163746fc89b.PNG)
\

Later when the training set was fixed for all the iterations and only test set was chosen randomly,a mean accuracy of 85.60% was observed mostly.The training progress plot with accuracy for different iteration using same training set is shown in the following Figure.
\
![4](https://user-images.githubusercontent.com/47361086/112360049-55d29780-8ceb-11eb-8f41-4cc7102a8da6.PNG)
## Installation and Running Procedure
This program requires a working MATLAB installation.
To run this program clone this repository into your workspace
```
git clone https://github.com/NithaElizabeth/NaiveBayesClassifier
```
## Author
The system was developed by Nitha Elizabeth John as a part of academic curriculam of EMARO.\
Author  : Nitha Elizabeth John\
Contact : nithaelizabethjohn@gmail.com

# NaiveBayesClassifier
This repo contains an implementation of Naive Bayes Algorithm from scratch without the use of any libraries or pre-defined function.
## Introduction
The aim of this project is to build a classifier to decide whether to play outside or not depending on the a set features that determines weather conditions.The data-set used for the experiments contain attributes such as "Outlook", "Temperature", "Humidity", "Windy". A Naive Bayes classifier assumes that the presence of a particular weather feature in a class is unrelated to the presence of any other weather feature. The Bayes’ Theorem evaluates the probability of an event occurring given the probability of another event that has already occurred. Bayes’ theorem is stated mathematically as the following equation: \
![1](https://user-images.githubusercontent.com/47361086/112357274-c9bf7080-8ce8-11eb-8c8c-c6e4b6ed35a5.PNG)
\
where c is a class variable and X is a feature vector.In this particular experiment,for example X = {overcast hot normal FALSE} and c = {CAN PLAY}.

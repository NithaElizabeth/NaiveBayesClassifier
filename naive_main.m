% --------------------------------------------------------------------------
% This is a Naive Bayes Classifier trained and tested on a Weather Dataset
% given in this root folder.
% This model is intended to classify the input into two category based on
% the provided data. The two categories are "CAN PLAY" and "CANNOT PLAY".
% Assumption : Values of one column is not repeated in other
% Programmed By : Nitha Elizabeth John
% Guided By : Prof.Stefano Rovetta 
% --------------------------------------------------------------------------

clc;
clear all;
close all;

%The dataset is loaded and read
file = 'weather_.data';
%table = readtable('weathernew.data.txt');
data_file = csvread(file);

%Removing the row that indicates the level of different attributes in 
%the given dataset
levels = data_file(1,:);
data_file(1,:) = [];

%for iter=1:500   Uncomment this for loop to iterate the program several
%times.On uncommenting the ieration loop please uncomment the last section
%that calculates the avarage accuracy

%Splitting the dataset into training and testing data
[X,Y] = size(data_file) ; 
data = data_file(randperm(size(data_file, 1)), :); %Change the variable 
                                                   %"data_file" to "data" 
                                                   %to select the training
                                                   %set randomly
train = data_file(1:round(X*0.70),:) ; 
[m,d] = size(train) ; 
test = data(round(X*0.70)+1:round(X),:) ;
[n,c] = size(test) ; 


if c>=d-1
    if all(train)>=1
        disp('-----------------------------------DATA-----------------------------------');
        fprintf(' \n');
        fprintf(' The selected training set \n');
        disp(train);
        fprintf(' The selected testing set \n');
        disp(test);
        fprintf('Size of training set = [ ');fprintf('%d ',size(train)); fprintf(']\n');
        fprintf('Size of testing set  = [ ');fprintf('%d ',size(test)); fprintf(']\n');
        fprintf('The selected test set \n');
        disp('-----------------------------------START-----------------------------------');
        [class,accuracy]=naive_classifier(n,m,d,train,test,levels);
        %[class,accuracy(iter)]=naive_classifier(n,m,d,train,test,levels);
        %uncoment this statment the iteration loop is uncommented.
        disp('-----------------------------------END-----------------------------------');
        fprintf('The overall acurracy yielded with selected test samples are:: %0.2f %%',accuracy);
        disp(' ');
        disp('-------------------------------------------------------------------------');
        disp('-------------------------------------------------------------------------');
    else
        fprintf('There are values in the dataset which are less than 1. Please reload a new dataset witha all values atleast 1');
    end
else
    fprintf('Coloumn size of test set is less than d \n');
end

%end
%%This is to calculate the average accuracy when iterated multiple times
% mean_ = mean(accuracy);
% figure(2);
% xlabel('Iterations');
% xlabel('Accuracy');
% plot(accuracy);
% title('Accuracy vs Iterations');
% fprintf('The mean acurracy yielded with selected test samples are:: %0.2f %%',mean_);


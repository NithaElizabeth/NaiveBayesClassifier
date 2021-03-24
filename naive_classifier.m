function [outputArg1,accuracy] = naive_classifier(n,m,d,train,test,v)

%This function executes various calculations like computation of priori 
%probabilities, likelihood probabailities, postpriori probabailities for 
%the Naive bayes classifier.
%The likelihood probability is computed incorporating the laplace smoothing
%This function takes the training data,testing data, levels of different 
%attributes and the size of test and train data as input parameters.
%This function gives the accuracy of the model as the output arguement.


dim = 2;
a = 0.8;


%Calculate priori probabilities
values=v ;
class= unique(train(:,d));
atribute_1= unique(train(:,1));
atribute_2= unique(train(:,2));
atribute_3= unique(train(:,3));
atribute_4= unique(train(:,4));

%The priori probability

for c=1:length(class)
     P_class(c)=sum(double(train(:,d)==class(c)))/length(train);
end

outputArg1 = P_class;
fprintf('Priori Probability');
disp(P_class);

%The calclation of likelihood probability and training with Laplace
%smoothing

for c=1:length(class)
    for x=1:d-1
        if x == 1
%             a = 0.33;
            for v =atribute_1(1,:): atribute_1(end,:)
                sum_class = sum(double(train(:,d)==c));
                P_atribute_1(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/(sum_class+a*3);
            end
        
        elseif x == 2
%             a = 0.33;
            for v =atribute_2(1,:): atribute_2(end,:)
                sum_class = sum(double(train(:,d)==c));
                P_atribute_2(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/(sum_class+a*3);
            end
            
        elseif x == 3
%             a = 1;
            for v =atribute_3(1,:): atribute_3(end,:)
                sum_class = sum(double(train(:,d)==c));
                P_atribute_3(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/(sum_class+a*2);
            end
            
        elseif x == 4
%             a = 1;
            for v =atribute_4(1,:): atribute_4(end,:)
                sum_class = sum(double(train(:,d)==c));
                P_atribute_4(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/(sum_class+a*2);
            end
        end
    end

end

%Discarding those test samples that were not present during the training
%phase

discard = ismember(test, train, 'legacy');
[row,col] = find(discard==0);
if isempty(row)==0
    for q=1:size(row)
    fprintf('ERROR : A sample of test set was not found in training set. The pattern discarded is at row %.15g %s',row(q));
    fprintf('. \n\n');
    end
end
test(row,:) = [];
n_=n;
if isempty(test)==0
    fprintf('The test data after discarding samples that were not in training dataset \n');
    disp(test);
    [n_,a]=size(test);
    
    %Testing starts here

    for c=1:length(class)
        for r = 1:n_
            for x=1:d-1

                if x == 1
                    if values(1,x)>= numel(unique(test(:,x)))
                        for v =atribute_1(1,:): atribute_1(end,:)
                            if test(r,x)== v
                                prob(r,v) = P_atribute_1(c,v);
                                m(r,1)=prob(r,v);
                            end
                        end
                    end
                elseif x == 2
                    if values(1,x)>= numel(unique(test(:,x)))
                        for v =atribute_2(1,:): atribute_2(end,:)
                            if test(r,x)== v
                                prob(r,v) = P_atribute_2(c,v);
                                m(r,2)=prob(r,v);
                            end
                        end
                    end

                elseif x == 3
                    if values(1,x)>= numel(unique(test(:,x)))
                        for v =atribute_3(1,:): atribute_3(end,:)
                            if test(r,x)== v
                                prob(r,v) = P_atribute_3(c,v);
                                m(r,3)=prob(r,v);
                            end
                        end
                    end

                elseif x == 4
                    if values(1,x)>= numel(unique(test(:,x)))
                        for v =atribute_4(1,:): atribute_4(end,:)
                            if test(r,x)== v
                                prob(r,v) = P_atribute_4(c,v);
                                m(r,4)=prob(r,v);
                            end
                        end
                    end
                end
            end

        end
        if c==1
            prob_YES = prod(m,dim)*P_class(c);
        elseif c==2
            prob_NO = prod(m,dim)*P_class(c);
        end
    end
else
    fprintf('[\bERROR : All values of test set were discarded. Model cannot be tested.]\b \n');
    prob_YES=0;
    prob_NO=0;
    n_=0;
    acc=0;
end

for k=1: n_
    if prob_YES(k) > prob_NO(k)
        fprintf(2,'__________________________________________________________________________ \n')
        fprintf('<strong>For test case : %2d </strong>\n',k);
        disp('CLASS : <strong>CAN PLAY</strong>')
        prediction = 1;
        if prediction ~= test(k,d)
            error = 1;acc(k)=0;
            fprintf('The error is =  %2d \n',error);
            disp('The accuracy is = 0%');
        else
            error = 0;acc(k)=100;
            fprintf('The error is =  %2d \n',error);
            disp('The accuracy is = 100%');
        end
    else
        fprintf(2,'__________________________________________________________________________ \n')
        fprintf('<strong>For test case : %2d </strong>\n',k);
        disp('CLASS : <strong>CANNOT PLAY</strong>');
        prediction = 2; 
        if prediction ~= test(k,d)
            error = 1;acc(k)=0;
            fprintf('The error is =  %2d \n',error);
            disp('The accuracy is = 0%');
        else
            error = 0;acc(k)=100;
            fprintf('The error is =  %2d \n',error);
            disp('The accuracy is = 100%');
        end
        
    end
    
end
tot_acc = sum(acc(1,:)/n);
accuracy = tot_acc;
end


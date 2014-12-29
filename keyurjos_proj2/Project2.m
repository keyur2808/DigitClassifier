clc ;
clear;
K=10;

[XTrain,TTrain,coeff]=load_data('train',0);
[XTest,TTest,~]=load_data('test',0);
% XTest=XTest*coeff(:,1:100);

%Logistic Regression
w=train_lr(XTrain,TTrain);
error=test_lr(w,XTest,TTest);
disp(error);

%NeuralNetwork
[W1,W2]=train_nn(XTrain,260,TTrain);
error2=test_nn(W1,W2,XTest,TTest);
disp(error2);

%NaiveBayesClassifier
error3=nbc_model(XTrain,TTrain,XTest,TTest);
disp(error3);
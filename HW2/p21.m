%% Problem 2.1
clc
% Load data into x and y:
data = load('dataset2.mat');
x = data.x;
y = data.y;

% filter the data by labels
x1 = x((y > 0), :);
x2 = x((y < 0), :);

% find mean and covariance
mu1 = mean(x1)';
mu2 = mean(x2)';
cov1 = cov(x1);
cov2 = cov(x2);



%% Unittest sph_bayes: 
xTest = [1 1 1]';
[p1, p2, Ytest] = sph_bayes(xTest, mu1, mu2, cov1, cov2)

 xTest = [0 0 0]';
[p1, p2, Ytest] = sph_bayes(xTest, mu1, mu2, cov1, cov2)

xTest = [0.5 0.5 0.5]';
[p1, p2, Ytest] = sph_bayes(xTest, mu1, mu2, cov1, cov2)

%% Unittest new_classifier
xTest = [1 1 1]';
Ytest = new_classifier(xTest, mu1, mu2)

xTest = [0 0 0]';
Ytest = new_classifier(xTest, mu1, mu2)

xTest = [0.5 0.5 0.5]';
Ytest = new_classifier(xTest, mu1, mu2)

%% Problem 2.1
% Load data
clc, clear
data = load('d1b.mat');
x = data.X;
y = data.Y;

%% Train SVM
clc, clf
hold on
% train the svm
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', false, 'BoxConstraint', 1);
% bias and support vectors are given by the model directly
bias = svm.Bias
sv = svm.SupportVectors;
% first, plot the support vectors
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10, 'LineWidth', 1)
% then, plot the point which could not be separated
plot(sv(2,1),sv(2,2),'rx','MarkerSize',18, 'LineWidth', 2)
% plot all of the points with class
gscatter(x(:,1),x(:,2),y,['r' 'b'])

% calculate weights from alpha * support vectors
w1 = dot(svm.Alpha, sv(:,1));
w2 = dot(svm.Alpha, sv(:,2));
% soft margin from eq. 5.12
soft_margin = 2/norm([w1 w2])

% slope of hyperplane
a = -w1/w2;
b = -svm.Bias/w2;

xx = linspace(-4,4);
yy = a*xx + b;
yl = a*xx + b - soft_margin/2*sqrt(1+a^2);
yu = a*xx + b + soft_margin/2*sqrt(1+a^2);
plot(xx, yy, '-k', 'LineWidth', 1)
plot(xx, yl, '--k', 'LineWidth', 1)
plot(xx, yu, '--k', 'LineWidth', 1)

%% Problem 2.1
% Load data
clc, clear
data = load('d1b.mat');
x = data.X;
y = data.Y;

%% Train SVM
clc
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', true);
bias = svm.Bias
%pause(1)
gscatter(x(:,1),x(:,2),y)
hold on
sv = svm.SupportVectors;
plot(sv(:,1),sv(:,2),'ko','MarkerSize',7)

w1 = dot(svm.Alpha, sv(:,1));
w2 = dot(svm.Alpha, sv(:,2));
bias = svm.Bias;

% or with line given as y = a*x + b
a = -w1/w2;
b = -svm.Bias/w2;
xx = linspace(-4,4);
yy = a*xx + b;
plot(xx, yy, '-k')
n = 2;
plot(sv(n,1),sv(n,2),'ko','MarkerSize',8)
plot(sv(n,1),sv(n,2),'ko','MarkerSize',9)
plot(sv(n,1),sv(n,2),'ko','MarkerSize',10)

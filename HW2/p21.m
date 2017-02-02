%% Problem 2.1

clc
% Load data into x and y:
data = load('dataset2.mat');
x = data.x;
y = data.y;

% Find probility for xTest:
% Usage:
xTest = [1 1 1]';
[p1, p2, Ytest] = sph_bayes(x, y, xTest)

xTest = [0 0 0]';
[p1, p2, Ytest] = sph_bayes(x, y, xTest)

xTest = [0.5 0.5 0.5]';
[p1, p2, Ytest] = sph_bayes(x, y, xTest)


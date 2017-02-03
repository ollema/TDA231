%% Problem 2.1
clc, clear all
% Load data into x and y:
data = load('dataset2.mat');
x = data.x;
y = data.y;
%% d)
format long
x1 = x((y > 0), :);
x2 = x((y < 0), :);
run CrossValidationScript

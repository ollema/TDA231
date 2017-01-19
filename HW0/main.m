%%
% Problem 2.1
f=@(x)function_p21(x);
ezplot(@(x,y)f([x,y]'),1)
%t=linspace(-2,2,100);
%[X,Y]=meshgrid(t,t);
%Z=f([X,Y]')

hold on
mu = [1 1];
sigma = [0.1 -0.05; -0.05 0.2];
data = generate_data(mu, sigma, 1000);

scatter(data)
%%
%f=@(x,y,r)
f=@(x,r)function_p21(x,r);
ezplot(@(x,y)f([x,y]',1))

%I dont know if ezplot is the best method to use to plot the level curves
%look up other methtods.... contour plots

%%
% Problem 2.2
clf
clc
clear
dataSet = load('dataset0.txt');
covariance = cov(dataSet);
correlation = corrcoef(dataSet);
scaleFactor = max(dataSet(:));
scaledSet = dataSet ./ scaleFactor;
scaledCovar = cov(scaledSet);
scaledCorr = corrcoef(scaledSet);

hold on
colormap jet

subplot(2,2,1)
imagesc(covariance)
colorbar
title('\fontsize{10pt}\rm{Covariance of dataset0 - }\it{\bf{X}}')

subplot(2,2,2)
imagesc(correlation)
colorbar
title('\fontsize{10pt}\rm{Correlation of dataset0 - }\it{\bf{X}}')

subplot(2,2,3)
imagesc(scaledCovar)
colorbar
title('\fontsize{10pt}\rm{Covariance of scaled dataset0 - }\it{\bf{Y}}')

subplot(2,2,4)
imagesc(scaledCorr)
colorbar
title('\fontsize{10pt}\rm{Correlation of scaled dataset0 - }\it{\bf{Y}}')


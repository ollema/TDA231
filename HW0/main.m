%%
% Problem 2.1
clf
hold on
mu = [1 1];
sigma = [0.1 -0.05; -0.05 0.2];
data = generateData(mu, sigma, 1000);
inside=(function_p21(data)-3<0);
outside=(function_p21(data)-3>0);
pointSize=10;
scatter(data(1,inside),data(2,inside),pointSize,'b','filled');
scatter(data(1,outside),data(2,outside),pointSize,'k','filled');

xLow=-0.5;
xHigh=2.5;
yLow=-0.5;
yHigh=2.5;
warning('off','all')%to turn of a wrongly produced performance error
f=@(x,y)function_p21([x,y]');
fcontour(f,[xLow xHigh yLow yHigh],'LevelList',[1,2,3],'LineColor','r','LineWidth',1.5)
warning('on','all')
title('\fontsize{10pt}\rm{Points outside level curve f(x,3)=0}\it{\bf{Y}}')
title(strcat(num2str(nnz(outside)),' '))
xlabel('x')
ylabel('y')
%%
% Problem 2.2
clf
clc
clear
format compact
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
xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
yticks([1 2 3 4 5 6 7 8 9 10 11 12]);

subplot(2,2,2)
imagesc(correlation)
colorbar
title('\fontsize{10pt}\rm{Correlation of dataset0 - }\it{\bf{X}}')
xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
yticks([1 2 3 4 5 6 7 8 9 10 11 12]);

subplot(2,2,3)
imagesc(scaledCovar)
colorbar
title('\fontsize{10pt}\rm{Covariance of scaled dataset0 - }\it{\bf{Y}}')
xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
yticks([1 2 3 4 5 6 7 8 9 10 11 12]);

subplot(2,2,4)
imagesc(scaledCorr)
colorbar
title('\fontsize{10pt}\rm{Correlation of scaled dataset0 - }\it{\bf{Y}}')
xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
yticks([1 2 3 4 5 6 7 8 9 10 11 12]);

[min, index] = min(scaledCovar(:));
[I_row, I_col] = ind2sub(size(scaledCovar),index);
figure

subplot(1,2,1)
scatter(scaledSet(:,I_col), scaledSet(:,I_row))
title('\fontsize{10pt}\rm{Correlation of scaled dataset0 - }\it{\bf{Y}}')

subplot(1,2,2)
scatter(scaledSet(:,8), scaledSet(:,1))
title('\fontsize{10pt}\rm{Correlation of scaled dataset0 - }\it{\bf{Y}}')
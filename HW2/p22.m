clc
load('digits.mat')
y=reshape(data(:,47,5),16,16);
data(:,45,5)
colormap('gray')
imagesc(y);
%y=reshape(data)
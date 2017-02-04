%% Unittest sph_bayes: 

clear all,clc
A=[1,0;1.1,0.1;1.3,0;0.9,0;3,0;2.9,0.1;2.85,0.01;3.185,0.2;1.2,0];
mu1=[1,0];
mu2=[3,0];
cov1=eye(2);
cov2=cov1;
[~,~, B] = sph_bayes(A,mu1,mu2,cov1,cov2);
C=new_classifier(A,mu1,mu2);
sum(B==C)

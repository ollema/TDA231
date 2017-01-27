%% Problem 22 a
load('dataset1.mat')
t=linspace(0.0001,5,10000);
figure(1)
hold on
priorData1=InverseGamma(t,1,1);
posteriorData1=PosteriorDistribution(t,mean(x),1,1,x);
plot(t,priorData1,'b');
plot(t,posteriorData1/max(posteriorData1),'r');

figure(2)
hold on
priorData2=InverseGamma(t,10,1);
posteriorData2=PosteriorDistribution(t,mean(x),10,1,x);
plot(t,priorData2,'b');
plot(t,posteriorData2,'r');
%-problem with visulasing the data!


%%
Test
clc
integral(@(s)PosteriorDistribution(s,mean(x),1,1,x),0.0000001,inf)
%% Problem 22 b

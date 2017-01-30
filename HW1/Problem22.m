%% Problem 22 a
load('dataset1.mat')
t=linspace(0.0001,1,1000);
n=size(x,1);
mu=mean(x);

alpha1=1;
beta1=1;
alphaHyper1=alpha1+n;
betaHyper1=beta1+0.5*sum(GetDistancesFromCenter(x,mu).^2);
priorData1=InverseGamma(t,alpha1,beta1);
posteriorData1=InverseGamma(t,alphaHyper1,betaHyper1);

subplot(1,2,1)
hold on
p1=plot(t,priorData1,'b','DisplayName','Prior');
p2=plot(t,posteriorData1,'r','DisplayName','Posterior');
title('\alpha=1, \beta=1')
xlabel('\sigma^2');
legend([p1 p2]);

alpha2=10;
beta2=1;
alphaHyper2=alpha2+n;
betaHyper2=beta2+0.5*sum(GetDistancesFromCenter(x,mu).^2);
priorData2=InverseGamma(t,alpha2,beta2);
posteriorData2=InverseGamma(t,alphaHyper2,betaHyper2);


subplot(1,2,2)
hold on
p3=plot(t,priorData2,'b','DisplayName','Prior');
p4=plot(t,posteriorData2,'r','DisplayName','Posterior');
title('\alpha=10, \beta=1')
xlabel('\sigma^2');
legend([p3 p4]);
%%
clc
BF = BayesFactor(alphaHyper1, alphaHyper2, betaHyper1, betaHyper2)
%BF = BayesFactor(alphaHyper2,alphaHyper1, betaHyper2, betaHyper1)


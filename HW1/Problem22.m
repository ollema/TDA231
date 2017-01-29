%% Problem 22 a
load('dataset1.mat')
t=linspace(0.0001,1.5,1000);
n=size(x,1);
mu=mean(x);

alpha1=1;
beta1=1;
alphaHyper1=alpha1+n;
betaHyper1=beta1+0.5*sum(GetDistancesFromCenter(x,mu).^2);
priorData1=InverseGamma(t,alpha1,beta1);
posteriorData1=InverseGamma(t,alphaHyper1,betaHyper1);

figure(1)
hold on
plot(t,priorData1,'b');
plot(t,posteriorData1,'r');

alpha2=10;
beta2=1;
alphaHyper2=alpha2+n;
betaHyper2=beta2+0.5*sum(GetDistancesFromCenter(x,mu).^2);
priorData2=InverseGamma(t,alpha2,beta2);
posteriorData2=InverseGamma(t,alphaHyper2,betaHyper2);

figure(2)
hold on
plot(t,priorData2,'b');
plot(t,posteriorData2,'r');

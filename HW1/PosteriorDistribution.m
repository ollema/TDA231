function [ out ] = PosteriorDistribution(s,mu,alpha,beta,data)
    n=size(data,1);
    alphaHyper=alpha+n;
    betaHyper=beta+0.5*sum(GetDistancesFromCenter(data,mu).^2);
    betaHyper/(alphaHyper+1);
    z1=-sum(log(1:n));
    z2=alphaHyper*log(betaHyper);
    z3=-(alphaHyper+1)*log(s);
    z4=-betaHyper./s;
    tmp=z1+z2+z3+z4;
    out=exp(tmp)/gamma(alpha)
end


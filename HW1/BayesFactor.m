function [ out ] = BayesFactor(aah, abh, bah, bbh)
    x1=abh-aah;
    x2=log(bbh)+gammaln(abh)+(aah+1)*log(aah+1)
    x3=log(bah)+gammaln(aah)+(abh+1)*log(abh+1)
    out=exp(x1+x2-x3);
end
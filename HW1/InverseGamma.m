function [ out ] = InverseGamma( s,alpha,beta)    
    
    z1=-gammaln(alpha);
    z2=alpha*log(beta);
    z3=-(alpha+1)*log(s);
    z4=-beta./s;
    tmp=z1+z2+z3+z4;
    
    out=exp(tmp);

end


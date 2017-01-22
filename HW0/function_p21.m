function [ out ] = function_p21(z)
    nData=size(z,2);
    mu=[1,1]';
    sigma=[0.1 -0.05;-0.05 0.2];
    out=0.5*sum( (z-repmat(mu,1,nData)).*( inv(sigma)*(z-repmat(mu,1,nData))));
end


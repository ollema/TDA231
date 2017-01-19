function [ out ] = function_p21(x)
    nData=size(x,2);
    mu=[1,1]';
    sigma=[0.1 -0.05;-0.05 0.2];
    out=0.5*sum( (x-repmat(mu,1,nData)).*( inv(sigma)*(x-repmat(mu,1,nData)) ) );
end


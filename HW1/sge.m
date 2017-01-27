function [mu_final, sigma_final] = sge(x)
%
% SGE Mean and variance estimator for spherical Gaussian distribution                               
%
% x     : Data matrix of size n x p where each row represents a 
%         p-dimensional data point e.g. 
%            x = [2 1;
%                 3 7;
%                 4 5 ] is a dataset having 3 samples each
%                 having two co-ordinates.
%
% mu    : Estimated mean of the dataset [mu_1 mu_2 ... mu_p] 
% sigma : Estimated standard deviation of the dataset (number)                 
%   
    X=x';
    mu=mean(X,2);
        
    nSamples=size(X,2);
    Z=X-repmat(mu,1,nSamples);
    np=numel(X);
    
    sigma_final=sqrt((1/np)*sum(sum(Z.*Z)));
    mu_final=mu';    
end
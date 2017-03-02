function [distance] = rbf_kernel(X)
    sigma = 0.2; %fix this hard coding
    n1sq = sum(X.^2,1);
    n1 = size(X,2);
    D = (ones(n1,1)*n1sq)' + ones(n1,1)*n1sq -2*X'*X;
    distance = exp(-D/(2*sigma^2));
end
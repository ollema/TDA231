function [ out ] = generate_data(mu,sigma,n)
    R = chol(sigma);
    out = repmat(mu,n,1) + randn(n,2)*R;
    out=out';
end
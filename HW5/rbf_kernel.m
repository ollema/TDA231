function [distance] = rbf_kernel(x1, x2)
    sigma = 0.2; %fix this hard coding

    n1sq = sum(x1.^2,1);
    n1 = size(x1,2);

    n2sq = sum(x2.^2,1);
    n2 = size(x2,2);
    D = (ones(n2,1)*n1sq)' + ones(n1,1)*n2sq -2*x1'*x2;
    distance = exp(-D/(2*sigma^2));
end
function [ out ] = gaussian(x, mu, sigma)
k = size(x, 1);
out = exp(-((x - mu)'*inv(sigma)*(x-mu))/2)/sqrt((2*pi)^k*det(sigma));
end
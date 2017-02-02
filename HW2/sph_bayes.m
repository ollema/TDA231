function [p1, p2, Ytest] = sph_bayes(x, y, xTest)
% label out the data
x1 = x(y > 0);
x2 = x(y < 0);

% find mean and covariance
mu1 = mean(x1);
mu2 = mean(x2);
cov1 = cov(x1);
cov2 = cov(x2);

% calculate "likelihoods"
pre1 = gaussian(xTest, mu1, cov1);
pre2 = gaussian(xTest, mu2, cov2);

% return the goods
p1 = pre1/(pre1 + pre2);
p2 = pre2/(pre1 + pre2);
probs = [p1, p2];
[~,Ytest] = max(probs);
end
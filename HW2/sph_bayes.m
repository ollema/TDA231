function [p1, p2, Ytest] = sph_bayes(xTest, mu1, mu2, cov1, cov2)
% calculate "likelihoods"
pre1 = mvnpdf(xTest, mu1, cov1);
pre2 = mvnpdf(xTest, mu2, cov2);

% return the goods
p1 = pre1./(pre1 + pre2);
p2 = pre2./(pre1 + pre2);
probs = [p1, p2];
[~,Ytest] = max(probs');
% fix class (class -1 or class 1 instead of class 1 or class 2)
Ytest = (Ytest - 3.*(Ytest > 1))';
end
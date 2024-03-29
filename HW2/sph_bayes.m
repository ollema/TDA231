function [Ytest] = sph_bayes(xTest,trainingDataX1,...
    trainingDataX2)
    %sph_bayes refactored
    mu1=mean(trainingDataX1);
    mu2=mean(trainingDataX2);
    sigma1 = mean(diag(cov(trainingDataX1)));
    sigma2 = mean(diag(cov(trainingDataX2)));

    % calculate "likelihoods"
    pre1 = mvnpdf(xTest, mu1, sigma1*eye(size(mu1,2)));
    pre2 = mvnpdf(xTest, mu2, sigma2*eye(size(mu2,2)));

    % return the goods
    p1 = pre1./(pre1 + pre2);
    p2 = pre2./(pre1 + pre2);
    probs = [p1, p2];
    [~,Ytest] = max(probs');
    % fix class (class -1 or class 1 instead of class 1 or class 2)
    Ytest = (Ytest - 3.*(Ytest > 1))';

end
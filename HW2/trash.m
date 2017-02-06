%old spherical

%xTest, mu1, mu2, sigma1, sigma2)
% calculate "likelihoods"
%pre1 = mvnpdf(xTest, mu1, sigma1*eye(size(mu1,2)));
%pre2 = mvnpdf(xTest, mu2, sigma2*eye(size(mu2,2)));

% return the goods
%p1 = pre1./(pre1 + pre2);
%p2 = pre2./(pre1 + pre2);
%probs = [p1, p2];
%[~,Ytest] = max(probs');
% fix class (class -1 or class 1 instead of class 1 or class 2)
%Ytest = (Ytest - 3.*(Ytest > 1))';
%end

%old new_classifier
%xTest, mu1, mu2)
%nSamples=size(xTest,1); %each sample comes as columns
%b = 1/2*(mu1+mu2);
%diff=(mu1-mu2);
%Ytest=sign(sum(repmat(diff,nSamples,1)...
%    .*(xTest-repmat(b,nSamples,1)),2)/norm(diff));
%end

% old bae_bayes
%xTest, mu1, mu2, cov1, cov2)
% calculate "likelihoods"
%pre1 = mvnpdf(xTest, mu1, cov1);
%pre2 = mvnpdf(xTest, mu2, cov2);

% return the goods
%p1 = pre1./(pre1 + pre2);
%p2 = pre2./(pre1 + pre2);
%probs = [p1, p2];
%[~,Ytest] = max(probs');
% fix class (class -1 or class 1 instead of class 1 or class 2)
%Ytest = (Ytest - 3.*(Ytest > 1))';
%end
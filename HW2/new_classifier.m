function [Ytest] = new_classifier(xTest, mu1, mu2)
b = 1/2*(mu1+mu2);
Ytest = sign((mu1-mu2)'*(xTest - b)/norm(mu1-mu2));
end
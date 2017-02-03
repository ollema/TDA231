function [out] = GetNewFeatureVector(digitData)
    Y=reshape(digitData,16,16);
    out=[var(Y'),var(Y)];
end


function [ out ] = BayesFactor(aah, abh, bah, bbh)
bq = bbh/bah;
aq = (abh + 1)/(aah + 1);
lngq = gammaln(abh)/gammaln(aah);
out = bq * aq * exp((aah - abh)\(aah*abh + aah + abh + 1) + lngq);
end
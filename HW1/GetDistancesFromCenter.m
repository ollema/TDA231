function [ distancesFromCenter ] = GetDistancesFromCenter( x,center )
    nDataPoints=size(x,1);
    z=x-repmat(center,nDataPoints,1);
    distancesFromCenter=sqrt(sum(z.*z,2));
end


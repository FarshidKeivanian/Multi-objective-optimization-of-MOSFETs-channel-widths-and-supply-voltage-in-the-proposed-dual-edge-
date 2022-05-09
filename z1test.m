function z1 = z1test(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n=numel(x);

   z1=1-exp(-sum((x-1/sqrt(n)).^2));

end


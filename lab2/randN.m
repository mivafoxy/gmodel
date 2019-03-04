function [nums] = randN(N,X0,a,c,m)

if nargin < 5
    X0 = 7;
    a = 52;
    c = 65;
    m = 71;
end
    
nums(1) = mod(a*X0 + c,m);
for i=2:1:N
    nums(i) = mod(a*nums(i-1) + c,m); 
end
end


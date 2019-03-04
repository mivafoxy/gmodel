function [nums] = normalN2(N)

for i=1:2:N
    S = 0;
    while S == 0 || S >1
        X = rand*2-1;
        Y = rand*2-1;
        S = X*X +Y*Y;
    end
    
    k = sqrt(-2*log(S)/S);
    nums(i) = X*k;
    if i+1 <= N
        nums(i+1) = Y*k;
    end
end
end


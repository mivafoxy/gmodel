function [Nt] = f3(r,b,t,t0,N0)

k = r/b;
Nt(1) = N0;
for i=2:1:length(t)
    Nt(i) = Nt(i-1) + r*Nt(i-1)*(1-Nt(i-1)/k); 
end

end


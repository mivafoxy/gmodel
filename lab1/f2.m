function [Nt] = f2(r,b,t,t0,N0)

k = r/b;
Nt = k*N0*exp(r*(t-t0))./(k + N0*(exp(r*(t-t0)) - 1));

end


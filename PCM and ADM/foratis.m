function nsymbols = foratis(r,M)
A=0;
for i=1:M
    A = A + (2*i -(M+1)).^2;
end
A = 1/sqrt(A/M);
for i = 1: length(r)
    for m = 1:M
        Am = A*(2*m-(M+1));
        distance(m) = (r(i)-Am)^2;
    end
    [min1,nsymbols(i)] = min(distance);
end
nsymbols = (nsymbols- 1);
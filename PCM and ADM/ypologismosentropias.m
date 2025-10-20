L = 10000;
x = randn(L,1);
b = 1;
a1 = [1  -0.9];
ar1 = filter(b,a1,x);
[A1,centers,D1,p1] = Lloyd_Max(ar1,2,-1,1);
[A2,centers,D2,p2] = Lloyd_Max(ar1,4,-1,1);
[A3,centers,D3,p3] = Lloyd_Max(ar1,8,-1,1);
H1=0;
for i=1:length(p1)
    if p1(i)>0
        H1 = H1 - (p1(i)*log2(p1(i)));
    end
end
H2=0;
for i=1:length(p1)
    if p1(i)>0
        H2 = H2 - (p2(i)*log2(p2(i)));
    end
end
H3=0;
for i=1:length(p1)
    if p1(i)>0
        H3 = H3 - (p3(i)*log2(p(i)));
    end
end
load cameraman.mat;
A = i(:);
A = (A-128)/128;
[Aq1,centers,D6,p6] = Lloyd_Max(A,2,-1,1)
H6=0;
for i=1:length(p6)
    if p6(i)>0
        H6 = H6 - (p6(i)*log2(p6(i)));
    end
end
[Aq2,centers,D7,p7] = Lloyd_Max(A,4,-1,1)
H7=0;
for i=1:length(p7)
    if p7(i)>0
        H7 = H7 - (p7(i)*log2(p7(i)));
    end
end

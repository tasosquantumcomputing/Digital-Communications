L = 10000;
x = randn(L,1);
b = 1;
a1 = [1 -0.9];
a2 = [1 -0.01];
ar1 = filter(b,a1,x);
ar2 = filter(b,a2,x);
A1 = interp(ar1,2);
A2 = interp(ar2,2);
ar1am = adm(A1,3);
ar2am = adm(A2,3)
plot(ar1am);
figure;
plot(ar2am);
figure;



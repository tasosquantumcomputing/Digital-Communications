load cameraman.mat;
A = i(:);
A = (A -128)/128;
[Aq1,centers,D4,p4] = Lloyd_Max(A,2,-1,1);
[Aq2,centers,D5,p5] = Lloyd_Max(A,4,-1,1);
for i = 1:length(D4)
    sqnr1(i) = mean(A.^2)/D4(i);
end
for i = 1:length(D5)
    sqnr2(i) = mean(A.^2)/D5(i);
end
plot((1:length(D4)),sqnr1)
xlabel('Επαναλήψεις')
ylabel('SQNR')
title('Πηγή Β PCM N=2')
figure;
plot((1:length(D5)),sqnr2)
xlabel('Επαναλήψεις')
ylabel('SQNR')
title('Πηγή Β PCM N=4')
figure;
Aq1 = 128*Aq1+128;
Af1 = reshape(Aq1,256,256);
imshow(uint8(Af1))
figure;
Aq2 = 128*Aq2+128;
Af2 = reshape(Aq2,256,256);
imshow(uint8(Af2))
figure;
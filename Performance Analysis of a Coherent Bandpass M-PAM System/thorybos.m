function sima=thorybos(S_m,SNR,M)

Eb=1/log2(M);
N_0=Eb/(10^(SNR/10));
thorybos=sqrt(N_0/2)*randn(size(S_m));
sima=S_m+thorybos;

function signal = AWGN(Sm,SNR,M)
Eb = 1/(log2(M));
N0 = Eb/(10^(SNR/10));
AWGN = sqrt(N0/2)*randn(size(Sm));
signal = Sm + AWGN
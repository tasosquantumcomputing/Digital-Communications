bits = randsrc(10^4,1,[0,1]);
symbolsnogray = Mapper(bits,4,0);
Sm = dPAM(symbolsnogray,4);
i=1;
for snr = 0:2:20
    signal = AWGN(Sm,snr,4);
    r = adPAM(signal);
    nsymbols = foratis(r,4);
    nbits = demapper(nsymbols,4,1);
    ber4(i) = ber(bits(1-length(nbits)),nbits);
    i=i+1;
end
plot(SNR,ber4)
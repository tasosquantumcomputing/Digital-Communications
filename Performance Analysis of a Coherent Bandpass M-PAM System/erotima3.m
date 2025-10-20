bits=randsrc(10^4,1,[0,1]);

Symbols4_nogray=Mapper(bits,4,0);
Sm=dPAM(Symbols4_nogray,4);
i=1;

for snr=0:2:20
	signal=AWGN(Sm,snr,4);
	r=aDPAM(signal);
	nsymbols=foratis(r,4);
	nbits=demapper(new_symbols,4,1);
	ser_4PAM_nG(i)=ser(Symbols4_nogray(1:length(nsymbols)),nsymbols);
    i=i+1;
end
Symbols8_nogray=Mapper(bits,8,0);
S_m=diamorphwtis_PAM(Symbols8_nogray,8);
i=1;

for snr=0:2:20
	signal=AWGN(Sm,snr,8);
	r=aPAM(sima);
	nsymbols=foratis(r,8);
	nbits=demapper(nsymbols,8,0);
	ser_8PAM_nG(i)=ser(Symbols8_nogray(1:length(nsymbols)),nsymbols);
	i=i+1;
end

Symbols4_gray=Mapper(bits,4,1);
Sm=dPAM(Symbols4_gray,4);
i=1;

for snr=0:2:20
	signal=thorybos(Sm,snr,4);
	r=aPAM(sima);
	nsymbols=foratisPAM(r,4);
	nbits=demapper(nsymbols,4,1);
	ser_4PAM(i)=ser(Symbols4_gray(1:length(nsymbols)),nsymbols);
	i=i+1;
end

%diamorphwsi 8-PAM me xrisi kwdika Gray
Symbols8_gray=Mapper(bits,8,1);
Sm=diamorphwtis_PAM(Symbols8_gray,8);
i=1;

for snr=0:2:20
	signal=AWGN(Sm,snr,8);
	r=aPAM(sima);
	nsymbols=foratisPAM(r,8);
	nbits=demapper(new_symbols,8,1);
	ser_8PAM(i)=ser(Symbols8_gray(1:length(nsymbols)),nsymbols);
	i=i+1;
end

SNR=0:2:20;

figure(1);
semilogy(SNR,ser_4PAM_nG,'g');
hold on;
semilogy(SNR,ser_8PAM_nG,'r');
xlabel('SNR/bit (db)');
ylabel('SER (NO GRAY)');
legend('4-PAM (No Gray)','8-PAM (No Gray)');

figure(2);
semilogy(SNR,ser_4PAM,'g');
hold on;
semilogy(SNR,ser_8PAM,'r');
xlabel('SNR/bit (db)');
ylabel('SER (GRAY)');
legend('4-PAM (Gray)','8-PAM (Gray)');
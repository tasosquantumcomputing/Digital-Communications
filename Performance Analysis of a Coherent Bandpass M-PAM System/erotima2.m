%dimiourgia dyadikis akolouthias
bits=randsrc(10^4,1,[0,1]);

%diamorphwsi 2-PAM xoris xrisi kwdika Gray
Symbols2_nogray=Mapper(bits,2,0);
S_m=diamorphwtis_PAM(Symbols2_nogray,2);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,2);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,2);
	new_bits=Demapper(new_symbols,2,1);
	ber_2PAM_nG(i)=ber(bits(1:length(new_bits)),new_bits);
    i=i+1;
end

%diamorphwsi 4-PAM xoris xrisi kwdika Gray
Symbols4_nogray=Mapper(bits,4,0);
S_m=diamorphwtis_PAM(Symbols4_nogray,4);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,4);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,4);
	new_bits=Demapper(new_symbols,4,1);
	ber_4PAM_nG(i)=ber(bits(1:length(new_bits)),new_bits);
    i=i+1;
end

%diamorphwsi 8-PAM xoris xrisi kwdika Gray
Symbols8_nogray=Mapper(bits,8,0);
S_m=diamorphwtis_PAM(Symbols8_nogray,8);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,8);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,8);
	new_bits=Demapper(new_symbols,8,0);
	ber_8PAM_nG(i)=ber(bits(1:length(new_bits)),new_bits);
	i=i+1;
end

%diamorphwsi 16-PAM xoris xrisi kwdika Gray
Symbols16_nogray=Mapper(bits,16,0);
S_m=diamorphwtis_PAM(Symbols16_nogray,16);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,16);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,16);
	new_bits=Demapper(new_symbols,16,0);
	ber_16PAM_nG(i)=ber(bits(1:length(new_bits)),new_bits);
	i=i+1;
end

%diamorphwsi 4-PAM me xrisi kwdika Gray
Symbols4_gray=Mapper(bits,4,1);
S_m=diamorphwtis_PAM(Symbols4_gray,4);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,4);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,4);
	new_bits=Demapper(new_symbols,4,1);
	ber_4PAM(i)=ber(bits(1:length(new_bits)),new_bits);
	i=i+1;
end

%diamorphwsi 8-PAM me xrisi kwdika Gray
Symbols8_gray=Mapper(bits,8,1);
S_m=diamorphwtis_PAM(Symbols8_gray,8);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,8);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,8);
	new_bits=Demapper(new_symbols,8,1);
	ber_8PAM(i)=ber(bits(1:length(new_bits)),new_bits);
	i=i+1;
end

%diamorphwsi 16-PAM me xrisi kwdika Gray
Symbols16_gray=Mapper(bits,16,1);
S_m=diamorphwtis_PAM(Symbols16_gray,16);
i=1;

for snr=0:5:40
	sima=thorybos(S_m,snr,16);
	r=apodiamorphwtis_PAM(sima);
	new_symbols=foratisPAM(r,16);
	new_bits=Demapper(new_symbols,16,1);
	ber_16PAM(i)=ber(bits(1:length(new_bits)),new_bits);
	i=i+1;
end

%diagrammata BER
SNR=0:5:40;

figure(1);
semilogy(SNR,ber_2PAM_nG,'b');
hold on;
semilogy(SNR,ber_4PAM_nG,'g');
hold on;
semilogy(SNR,ber_8PAM_nG,'r');
hold on;
semilogy(SNR,ber_16PAM_nG,'c');
grid on;
xlabel('SNR/bit (db)');
ylabel('BER (NO GRAY)');
legend('2-PAM (No Gray)','4-PAM (No Gray)','8-PAM (No Gray)','16-PAM (No Gray)');

figure(2);
semilogy(SNR,ber_4PAM,'g');
hold on;
semilogy(SNR,ber_8PAM,'r');
hold on;
semilogy(SNR,ber_16PAM,'c');
grid on;
xlabel('SNR/bit (db)');
ylabel('BER (GRAY)');
legend('4-PAM (Gray)','8-PAM (Gray)','16-PAM (Gray)');
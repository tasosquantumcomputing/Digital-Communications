function new_bits=Demapper(new_symbols,M,gray)

if (gray==1)
	new_symbols=gray2bin(new_symbols,'pam',M);
end

M_bits=dec2bin(new_symbols);
new_bits=reshape(M_bits',log2(M)*length(new_symbols),1);
new_bits=str2num(new_bits);

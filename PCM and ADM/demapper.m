function nbits = demapper(nsymbols,M,gray)
if (gray==1)
    nsymbols= gray2bin(nsymbols,'pam',M);
end

M_bits = dec2bin(nsymbols);
nbits = reshape(M_bits,log2(M)*length(nsymbols),1);
nbits = str2num(nbits)





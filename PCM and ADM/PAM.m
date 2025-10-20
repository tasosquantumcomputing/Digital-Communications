function symbols = Mapper(bits,M,gray)
rbits = reshape(bits(1:log2(M)*floor(length(bits)/log2(M))), log2(M) ,floor(length(bits)/log2(M)))';
symbols = bin2dec(num2str(rbits));
if (gray==1)
    symbols = bin2gray(symbols,'pam',M);
end
end

    




function g = pcm_decoder(h, i, j, k)
    l = bi2de(h, 'left-msb') + 1;
    m = 2^i;
    n = (k - j) / m;
    o = j + n/2 : n : k - n/2;
    g = o(l);
end
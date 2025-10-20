function a = pcm_encoder(b, c, d, e)
    [f, ~] = my_quantizer(b, c, d, e);
    a = de2bi(f - 1, c, 'left-msb');
end
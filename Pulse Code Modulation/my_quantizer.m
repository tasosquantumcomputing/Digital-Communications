function [a, b] = my_quantizer(c, d, e, f)
    c = max(min(c, f), e);
    g = 2^d;
    h = (f - e) / g;
    b = e + h/2 : h : f - h/2;
    a = min(floor((c - e) / h) + 1, g);
end
x = audioread('speech.wav');
x = x(1:10000);
a = -1; 
b = 1;
c = [2, 4, 8];
d = ['r', 'g', 'b'];
e = {'-', '--', '-.'};

figure;
hold on;

for f = 1:length(c)
    g = c(f);
    [h, i] = my_quantizer(x, g, a, b);
    h = max(min(h, length(i)), 1); 
    j = i(h); 
    k = mean((x(:) - j(:)).^2);
    l = 10 * log10(1 / k);
    
    m = 100;
    n = zeros(1, m);
    for o = 1:m
        [h, i] = my_quantizer(x, g, a, b);
        h = max(min(h, length(i)), 1);
        j = i(h); 
        k = mean((x(:) - j(:)).^2);
        n(o) = 10 * log10(1 / k);
    end
    
    plot(1:m, n, 'Color', d(f), 'LineStyle', e{f}, ...
         'DisplayName', sprintf('N = %d', g));
end

xlabel('Αριθμός Επαναλήψεων K_{max}');
ylabel('SQNR (dB)');
title('Μεταβολή του SQNR την my quantizer');
legend show;
grid on;
hold off;
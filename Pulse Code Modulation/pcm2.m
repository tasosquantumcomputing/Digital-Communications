x = audioread('speech.wav');
a = -1; 
b = 1;
c = 1e-10;
d = [2, 4, 8];
e = ['r', 'g', 'b'];
f = {'-', '--', '-.'};

figure;
hold on;

for g = 1:length(d)
    h = d(g);
    [~, ~, i] = Lloyd_Max(x, h, a, b);
    j = 10*log10(1 ./ i);
    plot(1:length(j), j, 'Color', e(g), 'LineStyle', f{g}, ...
         'DisplayName', sprintf('N = %d', h));
end

xlabel('Αριθμός Επαναλήψεων K_{max}');
ylabel('SQNR (dB)');
title('Μεταβολή του SQNR σε σχέση με το K_{max}');
legend show;
grid on;
hold off;

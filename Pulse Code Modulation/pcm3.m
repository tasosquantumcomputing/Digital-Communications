x = audioread('speech.wav');
x = x(1:10000);
a = -1;
b = 1;
c = [2, 4, 8];
d = zeros(length(c), 1);
e = zeros(length(c), 1);

for f = 1:length(c)
    g = c(f);
    [~, h, i] = Lloyd_Max(x, g, a, b);
    e(f) = i(end);
    [j, k] = my_quantizer(x, g, a, b);
    j = max(min(j, length(k)), 1);
    l = k(j);
    d(f) = mean((x - l(:)).^2);
end

figure;
plot(c, d, '-o', 'LineWidth', 1.5, 'DisplayName', 'Ομοιόμορφος');
hold on;
plot(c, e, '-s', 'LineWidth', 1.5, 'DisplayName', 'Μη Ομοιόμορφος');
xlabel('Αριθμός Bits (N)');
ylabel('MSE');
title('Σύγκριση MSE Ομοιόμορφου και Μη Ομοιόμορφου Κβαντιστή');
legend;
grid on;
hold off;
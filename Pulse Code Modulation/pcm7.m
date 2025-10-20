n_vals = [2, 4, 8];
mn = -1;
mx = 1;

[y, fs] = audioread('speech.wav');

for n = n_vals
    [q, ~] = my_quantizer(y, n, mn, mx);
    e = pcm_encoder(y, n, mn, mx);
    d = pcm_decoder(e, n, mn, mx);
    [q2, c2, ~] = Lloyd_Max(y, n, mn, mx);
    e2 = pcm_encoder(q2, n, mn, mx);
    d2 = pcm_decoder(e2, n, mn, mx);
    
    fprintf('Αναπαραγωγή αρχικού σήματος για N = %d\n', n);
    sound(y, fs); pause(length(y)/fs + 2);
    fprintf('Αναπαραγωγή ομοιόμορφα κβαντισμένου σήματος για N = %d\n', n);
    sound(d, fs); pause(length(d)/fs + 2);
    fprintf('Αναπαραγωγή Lloyd-Max κβαντισμένου σήματος για N = %d\n', n);
    sound(d2, fs); pause(length(d2)/fs + 2);

    figure;
    plot(y, 'b-', 'DisplayName', 'Αρχικό Σήμα');
    hold on;
    plot(d, 'r--', 'DisplayName', 'Ομοιόμορφος Κβαντιστής');
    plot(d2, 'g--', 'DisplayName', 'Μη Ομοιόμορφος Κβαντιστής');
    title(['Κβαντισμός, N = ', num2str(n)], 'FontName', 'Times New Roman', 'FontSize', 12);
    legend('Location', 'best', 'FontName', 'Times New Roman', 'FontSize', 10);
    hold off;
end



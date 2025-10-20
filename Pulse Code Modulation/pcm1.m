[y, fs] = audioread('speech.wav');
n = 4;
p = -1;
q = 1;

[a, ~] = my_quantizer(y, n, p, q);
b = pcm_encoder(y, n, p, q);
c = pcm_decoder(b, n, p, q);

[d, e, f] = Lloyd_Max(y, n, p, q);
g = pcm_encoder(d, n, p, q);
h = pcm_decoder(g, n, p, q);

figure;
subplot(3, 1, 1);
plot(y);
title('Σήμα Πηγής');
subplot(3, 1, 2);
plot(c);
title('Αποκωδικοποίση PCM με ομοιόμορφη Κβάντιση');
subplot(3, 1, 3);
plot(h);
title('Αποκωδικοποίση PCM με μη ομοιόμορφη Κβάντιση');

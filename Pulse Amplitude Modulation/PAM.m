R = 250e3;
T = 1 / R;
fc = 2.5e6;
fs = 10e6;
Ts = 1 / fs;
SNRdB = 0:2:20;
M_vals = [2, 8];
N = 1e5;

SER_res = cell(1, length(M_vals));
BER_res = cell(1, length(M_vals) * 2);

for m = 1:length(M_vals)
    M = M_vals(m);
    bps = log2(M);
    if mod(N, bps) ~= 0
        N = N + (bps - mod(N, bps));
    end
    sym_cnt = N / bps;
    bits = randsrc(1, N, [0 1]);
    syms = bi2de(reshape(bits, bps, []).', 'left-msb');
    levels = (2 * (1:M) - (M + 1));
    levels = levels / sqrt(mean(levels.^2));
    tx = levels(syms + 1);

    SER = zeros(size(SNRdB));
    BER_s = zeros(size(SNRdB));
    BER_g = zeros(size(SNRdB));
    
    for s = 1:length(SNRdB)
        snr = 10^(SNRdB(s) / 10);
        nv = 1 / (snr * 2);
        n = sqrt(nv) * randn(1, sym_cnt);
        rx = tx + n;
        [~, idx] = min(abs(rx.' - levels), [], 2);
        dec_syms = idx - 1;
        SER(s) = sum(syms ~= dec_syms) / sym_cnt;
        d_bits = de2bi(dec_syms, bps, 'left-msb').';
        d_bits = d_bits(:).';
        BER_s(s) = sum(bits ~= d_bits) / N;
        g_syms = bitxor(syms, floor(syms / 2));
        g_tx = levels(g_syms + 1);
        g_n = sqrt(nv) * randn(1, sym_cnt);
        g_rx = g_tx + g_n;
        [~, g_idx] = min(abs(g_rx.' - levels), [], 2);
        g_dec_syms = bitxor(g_idx - 1, floor((g_idx - 1) / 2));
        g_d_bits = de2bi(g_dec_syms, bps, 'left-msb').';
        g_d_bits = g_d_bits(:).';
        BER_g(s) = sum(bits ~= g_d_bits) / N;
    end
    
    SER_res{m} = SER;
    BER_res{(m - 1) * 2 + 1} = BER_s;
    BER_res{(m - 1) * 2 + 2} = BER_g;
end

figure;
semilogy(SNRdB, SER_res{1}, '-o', 'DisplayName', 'M=2 SER');
hold on;
semilogy(SNRdB, SER_res{2}, '-s', 'DisplayName', 'M=8 SER');
grid on;
xlabel('SNR (dB)');
ylabel('SER');
legend;
title('SER for M=2 and M=8');

figure;
semilogy(SNRdB, BER_res{1}, '-o', 'DisplayName', 'M=2 BER');
hold on;
semilogy(SNRdB, BER_res{2}, '-s', 'DisplayName', 'M=8 BER');
semilogy(SNRdB, BER_res{3}, '-x', 'DisplayName', 'M=8 Gray BER');
grid on;
xlabel('SNR (dB)');
ylabel('BER');
legend;
title('BER for M=2 and M=8 (Gray)');

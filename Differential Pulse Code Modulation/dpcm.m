d = load('source.mat');
f = fieldnames(d);
if isempty(f)
    error('No variables found in source.mat.');
end
x = d.(f{1});
if isempty(x)
    error('The loaded signal is empty.');
end

r = [-3.5, 3.5];
p = 5:10;
n = [1, 2, 3];

m = zeros(length(p), length(n));
c = cell(length(p), 1);

for i = 1:length(p)
    po = p(i);
    a = zeros(po, po);
    b = zeros(po, 1);

    for j = 1:po
        b(j) = mean(x((po + 1):end) .* x((po + 1 - j):(end - j)));
        for k = 1:po
            l = abs(j - k);
            a(j, k) = mean(x((po + 1):end) .* x((po + 1 - l):(end - l)));
        end
    end

    coef = a \ b;
    c{i} = coef;

    for ni = 1:length(n)
        nb = n(ni);
        ql = 2^nb;
        s = (r(2) - r(1)) / ql;
        q = linspace(r(1) + s / 2, r(2) - s / 2, ql);

        e = zeros(size(x));
        xr = zeros(size(x));

        for idx = (po + 1):length(x)
            pv = sum(coef .* flip(x(idx - po:idx - 1)));
            e(idx) = x(idx) - pv;
            [~, cid] = min(abs(q - e(idx)));
            qe = q(cid);
            xr(idx) = qe + pv;
        end

        m(i, ni) = mean((x((po + 1):end) - xr((po + 1):end)).^2);
        figure;
        plot((po + 1):length(x), x((po + 1):end), 'b-', 'LineWidth', 1.5, 'DisplayName', 'Αρχικό Σήμα');
        hold on;
        plot((po + 1):length(x), xr((po + 1):end), 'c--', 'LineWidth', 1.5, 'DisplayName', sprintf('Ανακατασκευασμένο Σήμα (N=%d)', nb));
        legend;
        xlabel('Δείκτης Δείγματος');
        ylabel('Πλάτος');
        title(sprintf('Αρχικό και Ανακατασκευασμένο (p=%d, N=%d)', po, nb));
        grid on;

        figure;
        plot((po + 1):length(x), x((po + 1):end), 'b-', 'LineWidth', 1.5, 'DisplayName', 'Αρχικό Σήμα');
        hold on;
        plot((po + 1):length(x), e((po + 1):end), 'c-.', 'LineWidth', 1.5, 'DisplayName', sprintf('Σφάλμα Πρόβλεψης (N=%d)', nb));
        legend;
        xlabel('Δείκτης Δείγματος');
        ylabel('Πλάτος');
        title(sprintf('Αρχικό και Σφάλμα Πρόβλεψης (p=%d, N=%d)', po, nb));
        grid on;
    end
end
figure;
hold on;
for i = 1:length(p)
    plot(n, m(i, :), '-s', 'LineWidth', 1.5, 'Color', 'b', 'MarkerFaceColor', 'cyan', 'DisplayName', sprintf('p=%d', p(i)));
end
xlabel('Bits Κβάντισης (N)');
ylabel('Μέσο Τετραγωνικό Σφάλμα (MSE)');
title('MSE και Bits Κβάντισης για Διάφορες Τάξεις Προβλέψεων');
legend;
grid on;

max_len = max(cellfun(@length, c));

coeff_matrix = NaN(max_len, length(p));
for i = 1:length(p)
    coeff_matrix(1:length(c{i}), i) = c{i};
end

coeff_table = array2table(coeff_matrix, 'VariableNames', strcat('p', string(p)));

disp(coeff_table);
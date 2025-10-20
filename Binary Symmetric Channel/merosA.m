%ερώτημα 1
I = imread('parrot.png');
Iflat = I(:);
[symbols, ~, ic] = unique(Iflat, 'stable');
counts = accumarray(ic, 1);
probs = counts/numel(Iflat);
disp(mat2str(symbols))
disp(mat2str(probs))
if abs(sum(probs) - 1) > 1e-6
    error('Οι πιθανότηες δεν αθροίζονται στο 1.');
end
entropy = -sum(probs .* log2(probs + (probs == 0)));
[dict, avglen] = huffmandict(symbols, probs);

n = entropy/avglen;

ana2 = [Iflat(1:end-1), Iflat(2:end)]; 
[zeugaria, ~, metrima] = unique(ana2,"rows");
freq = accumarray(metrima, 1);
prob = freq / sum(freq);
huff = huffmandict(1:length(freq), prob);
len = cellfun(@length, huff(:,2));
avg_len = sum(prob .* len);
entropy2 = -sum(prob(prob > 0) .* log2(prob(prob > 0)));
n2 = entropy2 / avg_len;

%ερώτημα 4
code = huffmanenco(I(:),dict);
deco = huffmandeco(code,dict);
bI = reshape((dec2bin(typecast(I(:),'uint8'),4)-'0').',1,[]);
J = length(code)/ length(bI);

%ερώτημα 5

x = huffmanenco(symbols,dict);
y = binary_symmetric_channel(x);

error_count = sum(x ~= y);
p = error_count / length(x);
if p == 0 || p == 1
    mutual_information = 0;
else
    mutual_information = 1 + p*log2(p) + (1-p)*log2(1-p);
end



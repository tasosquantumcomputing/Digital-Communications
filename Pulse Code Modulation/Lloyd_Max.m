function [yq, c, d, p] = Lloyd_Max(x, n, minv, maxv)
    yq = zeros(length(x), 1);
    m = 2^n;
    c = zeros(m - 1, 1);
    e = 10^(-9);
    t = zeros(m - 1, 1);

    s = (maxv - minv) / m;
    for i = 1:m
        c(i) = maxv - (s / 2) - (i - 1) * s;
    end

    r = 0;
    diff = 1;
    while (diff > e)
        r = r + 1;

        for i = 1:(m - 1)
            t(i) = (c(i) + c(i + 1)) / 2;
        end

        sm = zeros(m, 1);
        sa = zeros(m, 1);

        for i = 1:length(x)
            for j = 1:(m - 1)
                if x(i) > t(j)
                    yq(i) = c(j);
                    sm(j) = sm(j) + x(i);
                    sa(j) = sa(j) + 1;
                    break;
                end
            end
            if x(i) < t(m - 1)
                yq(i) = c(m);
                sm(m) = sm(m) + x(i);
                sa(m) = sa(m) + 1;
            end
        end

        for i = 1:m
            if (sa(i) ~= 0)
                c(i) = sm(i) / sa(i);
            end
        end

        d(r) = mean((x - yq).^2);
        if (r > 1)
            diff = abs(d(r) - d(r - 1));
        end
    end

    p = sa / length(x);
end

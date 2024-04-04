function [ys, ss] = generate(xs, a, b, c, mu, sigma)
    ss = normrnd(mu, sigma, size(xs));
    for i = 1:length(ss)
        if ss(i) < 0.001
            ss(i) = 0.001;
        end
    end
    ys = a*xs.^2 + b*xs + c;
    for i = 1:length(ys)
        ys(i) = normrnd(ys(i), ss(i));
    end
end
function [a, b, c, dist] = fit (xs, ys, sigmas)
    A4 = sum(xs.^4 ./ (sigmas.^2));
    A3 = sum(xs.^3 ./ (sigmas.^2));
    A2 = sum(xs.^2 ./ (sigmas.^2));
    A1 = sum(xs.^1 ./ (sigmas.^2));
    A0 = sum(xs.^0 ./ (sigmas.^2));
    A = [A4, A3, A2; A3, A2, A1; A2, A1, A0];
    
    Y2 = sum(ys .* xs.^2 ./ (sigmas.^2));
    Y1 = sum(ys .* xs.^1 ./ (sigmas.^2));
    Y0 = sum(ys ./ (sigmas.^2));
    Y = [Y2; Y1; Y0];

    coefs = inv(A) * Y;
    a = coefs(1, 1);
    b = coefs(2, 1);
    c = coefs(3, 1);
    dist = chi2(ys, xs, a, b, c, sigmas);
end
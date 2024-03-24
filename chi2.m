function dist = chi2(ys, xs, a,b,c, sigma_y)
    dist = sum((ys - a*xs.^2 - b*xs - c).^2 ./ sigma_y);
end


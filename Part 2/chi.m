function dist = chi(y, f, sigma)
    dist = sum((y - f).^2 ./ sigma.^2);
end


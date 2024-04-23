function mu = func(T, T0, u_min, tau, f_bl)
    t = (T - T0) ./ tau;
    u = sqrt(u_min.^2 + t.^2);
    mu = f_bl .* (2 + u.^2) ./ (u .* sqrt(4 + u.^2)) + 1 - f_bl;
end


function mu = gen_func(T, T0, u_min, tau)
    t = (T - T0) / tau;
    u = sqrt(u_min^2 + t.^2);
    mu = (2 + u.^2) ./ (u .* sqrt(4 + u.^2));
end


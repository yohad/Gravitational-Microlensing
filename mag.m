function mu = mag(u_min, tau, T_0, T)
    t = (T - T_0) / tau;
    u = sqrt(u_min^2 + t.^2);
    mu = (2+u.^2) ./ (u .* sqrt(4 + u.^2));
end
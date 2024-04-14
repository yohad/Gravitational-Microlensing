function [u_min, tau, dist] = fit(t, F, sigma_F, T0, u_min_range, tau_range)
chi_mat = zeros(length(u_min_range), length(tau_range));
for i = 1:length(u_min_range)
    for j = 1:length(tau_range)
        f = mag(u_min_range(i), tau_range(j), T0, t);
        chi_mat(i, j) = sum((F-f).^2 ./ sigma_F.^2);
    end
end

[cursor, dist] = matrix_min(chi_mat);
i = cursor(1);
j = cursor(2);
u_min = u_min_range(i);
tau = tau_range(j);
end


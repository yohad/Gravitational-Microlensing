function [u_min, tau, dist] = fit(t, F, sigma_F, T0, u_min, tau)
u_min = reshape(u_min, 1, length(u_min));
tau = reshape(tau, 1, 1, length(tau));
f = mag(u_min, tau, T0, t);
chi_mat = squeeze(sum((F - f).^2 ./ sigma_F.^2));

[cursor, dist] = matrix_min(chi_mat);
i = cursor(1);
j = cursor(2);
u_min = u_min(i);
tau = tau(j);
end


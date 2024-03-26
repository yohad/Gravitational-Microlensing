u_min = 1;
tau = 5;
T_0 = 50;

sigma_y = 0.01;

t = linspace(2, 100, 100);
y = mag(u_min, tau, T_0, t);
sigma = normrnd(0, sigma_y, size(y));
y = y + sigma;

u_min_range = linspace(u_min-1, u_min+1, 1000);
tau_range = linspace(tau-1, tau + 1, 1000);

chi_mat = zeros(length(u_min_range), length(tau_range));
sigma_f = sigma_y * ones(size(y));
for i = 1:length(u_min_range)
    for j = 1:length(tau_range)
        f = mag(u_min_range(i), tau_range(j), T_0, t);
        chi_mat(i, j) = chi(y, f, sigma_f);
    end
end

[i, j, dist] = matrix_min(chi_mat);
txt = sprintf("u_min: %f, tau: %f, chi^2: %d", u_min_range(i), tau_range(j), dist);
disp(txt);

contour(tau_range, u_min_range, chi_mat - dist, [2.3, 4.61, 6.18, 9.21], ...
    "ShowText", "on");

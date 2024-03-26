data = load("SMC_001.dat");

t = data(:, 1);
t_offset = t(1);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

m_0 = 20.479;
F = 10.^(0.4*(m_0-m));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

T_0 = 2454476.072 - t_offset;
u_min_range = linspace(0.05, 0.2, 1000);
tau_range = linspace(48, 53, 1000);

chi_mat = zeros(length(u_min_range), length(tau_range));
for i = 1:length(u_min_range)
    for j = 1:length(tau_range)
        f = mag(u_min_range(i), tau_range(j), T_0, t);
        chi_mat(i, j) = chi(F, f, sigma_F);
    end
end

[i, j, dist] = matrix_min(chi_mat);
u_min = u_min_range(i);
tau = tau_range(i);
txt = sprintf("u_min: %f, tau: %f, chi^2: %d", u_min_range(i), tau_range(j), dist);
disp(txt);

contour(tau_range, u_min_range, chi_mat - dist, [2.3, 4.61, 6.18, 9.21], ...
    "ShowText", "on");

figure
hold on
errorbar(t, F, sigma_F, ".");
f = mag(u_min, tau, T_0, t);
plot(t, f, Color="red");
hold off

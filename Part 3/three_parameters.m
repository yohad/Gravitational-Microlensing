data = load("SMC_001.dat");

m_0 = 20.479;

t = data(:, 1);
t_offset = t(1);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

F = 10.^(0.4*(m_0-m));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

tau_range = linspace(49, 52, 100);
u_min_range = linspace(0, 0.3, 100);
T0_range = linspace(2360, 2380, 100);

chi = zeros(length(tau_range), length(u_min_range), length(T0_range));
for i = 1:length(tau_range)
    for j = 1:length(u_min_range)
        for k = 1:length(T0_range)
            f = gen_func(t, T0_range(k), u_min_range(j), tau_range(i));
            chi(i, j, k) = sum((F - f).^2 ./ sigma_F.^2);
        end
    end
end
[cursor, dist] = matrix_min(chi);
i = cursor(1);
j = cursor(2);
k = cursor(3);
tau = tau_range(i);
u_min = u_min_range(j);
T0 = T0_range(k);

tf = linspace(t(1), t(end), 10000);
f = gen_func(tf, T0, u_min, tau);
hold on
plot(tf, f);
errorbar(t, F, sigma_F, ".");
hold off

subplot(1, 3, 1)
hold on
mat = squeeze(chi(i, :, :));
contour(T0_range, u_min_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off

subplot(1, 3, 2)
hold on
mat = squeeze(chi(:, j, :));
contour(T0_range, tau_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off

subplot(1, 3, 3)
hold on
mat = squeeze(chi(:, :, k));
contour(u_min_range, tau_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off

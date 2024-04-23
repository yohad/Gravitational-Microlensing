data = load("BLG_002.dat");

m_0 = 17.188;

t = data(:, 1);
t_offset = t(1);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

F = 10.^(0.4*(m_0-m));
F = F / mean(F(1:100));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

T0 = 2454517.540 - t_offset;

tau_range = linspace(15, 100, 100);
u_min_range = linspace(0.1, 0.5, 100);
f_bl_range = linspace(0, 1, 100);

chi = zeros(length(tau_range), length(u_min_range), length(f_bl_range));
for i = 1:length(tau_range)
    for j = 1:length(u_min_range)
        for k = 1:length(f_bl_range)
            f = func(t, T0, u_min_range(j), tau_range(i), f_bl_range(k));
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
f_bl = f_bl_range(k);
t = t + t_offset;
T0 = T0 + t_offset;

tf = linspace(t(1), t(end), 10000);
f = func(tf, T0, u_min, tau, f_bl);
hold on
errorbar(t, F, sigma_F, ".");
plot(tf, f);
legend("Data", "Fitted Function");
title("2008-BLG-002");
xlabel("T [JD]");
ylabel("$\mu$", Interpreter="latex");
hold off

subplot(1, 3, 1)
hold on
mat = squeeze(chi(i, :, :));
contour(f_bl_range, u_min_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off

subplot(1, 3, 2)
hold on
mat = squeeze(chi(:, j, :));
contour(f_bl_range, tau_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off

subplot(1, 3, 3)
hold on
mat = squeeze(chi(:, :, k));
contour(u_min_range, tau_range, mat - dist, [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], ...
    "ShowText", "on");
hold off
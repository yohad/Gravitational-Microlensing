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

tau_range = linspace(10, 20, 100);
u_min_range = linspace(0.1, 0.5, 100);
f_bl_range = linspace(0, 1, 100);

tau_range = reshape(tau_range, 1, length(tau_range));
u_min_range = reshape(u_min_range, 1, 1, length(u_min_range));
f_bl_range = reshape(f_bl_range, 1, 1, 1, length(f_bl_range));

f = func(t, T0, u_min_range, tau_range, f_bl_range);
chi = squeeze(sum((F - f).^2 ./ sigma_F.^2));

% Because our matrix_min algorithm doesn't promise to find the real min
% value, but its quite fast, we just run it multiple times
[cursor, dist] = matrix_min(chi);
for idx = 1:20
    [c, d] = matrix_min(chi);
    if d < dist
        cursor = c;
        dist = d;
    end
end
i = cursor(1);
j = cursor(2);
k = cursor(3);
tau = tau_range(i);
u_min = u_min_range(j);
f_bl = f_bl_range(k);
t = t + t_offset;
T0 = T0 + t_offset;
fprintf("tau=%.3f, u_min=%.3f, f_bl=%.3f, dist=%.3f, real_min=%.3f\n", tau, u_min, f_bl, dist, min(min(min(chi))));

tf = linspace(t(1), t(end), 10000);
f = func(tf, T0, u_min, tau, f_bl);
figure
hold on
errorbar(t, F, sigma_F, ".");
plot(tf, f);
legend("Data", "Fitted Function");
title("2008-BLG-002");
xlabel("T [JD]");
ylabel("$\mu$", Interpreter="latex");
hold off

tau_range = squeeze(tau_range);
u_min_range = squeeze(u_min_range);
f_bl_range = squeeze(f_bl_range);

figure
subplot(1, 3, 1)
hold on
mat = squeeze(chi(i, :, :));
contour(f_bl_range, u_min_range, mat - dist, ...
    [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], "ShowText", "on");
xlabel("$f_{bl}$", Interpreter="latex");
ylabel("$u_{min}$", Interpreter="latex");
hold off

subplot(1, 3, 2)
hold on
mat = squeeze(chi(:, j, :));
contour(f_bl_range, tau_range, mat - dist, ...
    [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], "ShowText", "on");
xlabel("$f_{bl}$", Interpreter="latex");
ylabel("$\tau[JD]$", Interpreter="latex");
hold off

subplot(1, 3, 3)
hold on
mat = squeeze(chi(:, :, k));
contour(u_min_range, tau_range, mat - dist, ...
    [3.53, 6.25, 8.02, 11.3, 14.2, 21.1], "ShowText", "on");
xlabel("$u_{min}$", Interpreter="latex");
ylabel("$\tau[JD]$", Interpreter="latex");
hold off
u_min_range = linspace(0.1, 0.2, 100);
tau_range = linspace(48, 52, 100);

m_0 = 20.479;


data = load("SMC_001.dat");

t = data(:, 1);
t_offset = t(1);
T0_range = linspace(2350, 2400, 300);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

F = 10.^(0.4*(m_0-m));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

T0 = T0 - t_offset;

[u_min, tau, T0, dist] = fit3(t, F, sigma_F, T0_range, u_min_range, tau_range);
fprintf("u_min: %.3f, tau: %.3f, T0: %.3f\n", u_min, tau, T0);

L = 1000;
u_min_store = zeros(1, L);
tau_store = zeros(1, L);
T0_store = zeros(1, L);
dist_store = zeros(1, L);

for i = 1:L
    fprintf("%d\n", i);
    new_F = sim(t, sigma_F, tau, u_min, T0);
    [u_min_tmp, tau_tmp, T0_tmp, dist_tmp] = fit3(t, new_F, sigma_F, T0_range, u_min_range, tau_range);
    u_min_store(i) = u_min_tmp;
    tau_store(i) = tau_tmp;
    T0_store(i) = T0_tmp;
    dist_store(i) = dist_tmp;
end
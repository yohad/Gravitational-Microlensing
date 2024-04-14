u_min_range = linspace(0.1, 0.2, 1000);
tau_range = linspace(45, 55, 1000);
T0 = 2454476.072;
m_0 = 20.479;


data = load("SMC_001.dat");

t = data(:, 1);
t_offset = t(1);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

F = 10.^(0.4*(m_0-m));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

T0 = T0 - t_offset;

[u_min, tau, dist] = fit(t, F, sigma_F, T0, u_min_range, tau_range);

L = 100;
u_min_store = zeros(1, L);
tau_store = zeros(1, L);
dist_store = zeros(1, L);

for i = 1:L
    disp(sprintf("%d", i));
    new_F = sim(t, sigma_F, tau, u_min, T0);
    [u_min_tmp, tau_tmp, dist_tmp] = fit(t, new_F, sigma_F, T0, u_min_range, tau_range);
    u_min_store(i) = u_min_tmp;
    tau_store(i) = tau_tmp;
    dist_store(i) = dist_tmp;
end
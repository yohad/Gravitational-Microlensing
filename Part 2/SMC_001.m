u_min_range = linspace(0.1, 0.2, 1000);
tau_range = linspace(45, 55, 1000);
T_0 = 2454476.072;
m_0 = 20.479;
[u_min, tau, dist] = nonlinear_fit("SMC_001.dat", u_min_range, tau_range, T_0, m_0);

m = mass(60, tau)
u_min_range = linspace(1.5, 2, 1000);
tau_range = linspace(55, 60, 1000);
T_0 = 2454499.198;
m_0 = 16.122;
[u_min, tau, dist] =nonlinear_fit("BLG_024.dat", u_min_range, tau_range, T_0, m_0);

m = mass(8, tau)
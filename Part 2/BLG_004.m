u_min_range = linspace(0.1, 0.2, 1000);
tau_range = linspace(15, 20, 1000);
T_0 = 2454521.168;
m_0 = 16.611;
[u_min, tau, dist] = nonlinear_fit("BLG_004.dat", u_min_range, tau_range, T_0, m_0);

m = mass(8, tau)
u_min_range = linspace(1, 2, 1000);
tau_range = linspace(20, 30, 1000);
T_0 = 2454557.498;
m_0 = 17.809;
[u_min, tau, dist] = nonlinear_fit("BLG_127.dat", u_min_range, tau_range, T_0, m_0);

m = mass(8, tau)
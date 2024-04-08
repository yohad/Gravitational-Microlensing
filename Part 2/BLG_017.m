u_min_range = linspace(0, 0.1, 1000);
tau_range = linspace(1, 10, 1000);
T_0 = 2454512.189;
m_0 = 19.779;
[u_min, tau, dist] =nonlinear_fit("BLG_017.dat", u_min_range, tau_range, T_0, m_0);

m = mass(8, tau)
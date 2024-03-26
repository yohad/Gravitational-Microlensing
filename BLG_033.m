u_min_range = linspace(0.2, 0.5, 1000);
tau_range = linspace(30, 40, 1000);
T_0 = 2454531.042;
m_0 = 17.445;
nonlinear_fit("BLG_033.dat", u_min_range, tau_range, T_0, m_0);
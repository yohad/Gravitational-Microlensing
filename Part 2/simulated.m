T0 = 2454476.072;
m0 = 20.479;
u_min = 0.121;
tau = 51.032;
T = linspace(2454400, 2454600, 1000);
sigma = 0.05;

T_offset = T(1);
T = T - T_offset;
T0 = T0 - T_offset;

L = 1000;
t = (T - T0) / tau;
u = sqrt(u_min^2 + t.^2);
mu_no_err = (2+u.^2) ./ (u .* sqrt(4 + u.^2));

u_min_range = linspace(0, 0.2, 100);
tau_range = linspace(50, 52, 100);
u_min_store = zeros(1,L);
tau_store = zeros(1, L);
dist_store = zeros(1, L);
for k = 1:L
    mu = normrnd(mu_no_err, sigma);
    
    chi_mat = zeros(length(u_min_range), length(tau_range));
    for i = 1:length(u_min_range)
        for j = 1:length(tau_range)
            f = mag(u_min_range(i), tau_range(j), T0, T);
            chi_mat(i, j) = chi(mu, f, sigma);
        end
    end
    
    [cursor, dist] = matrix_min(chi_mat);
    i = cursor(1);
    j = cursor(2);
    u_min_store(k) = u_min_range(i);
    tau_store(k) = tau_range(j);
    dist_store(k) = dist;
    fprintf("%d\n", k);
end

figure
subplot(3, 1, 1);
histogram(u_min_store, 3);
xlabel("$u_{min}$", Interpreter="latex");
ylabel("N");
txt = sprintf("$u_{min} = %.3f \\pm %.3f$", mean(u_min_store), std(u_min_store) / sqrt(L));
title(txt, Interpreter="latex");


subplot(3, 1, 2);
histogram(tau_store, 15);
xlabel("$\tau [JD]$", Interpreter="latex");
ylabel("N");
txt = sprintf("$\\tau = %.3f \\pm %.3f$", mean(tau_store), std(tau_store) / sqrt(L));
title(txt, Interpreter="latex");

subplot(3, 1, 3);
dist_store = dist_store / length(T);
histogram(dist_store, 15);
xlabel("$\chi^2$", Interpreter="latex");
ylabel("N");
txt = sprintf("$\\chi^2 = %.3f \\pm %.3f$", mean(dist_store), std(dist_store) / sqrt(L));
title(txt, Interpreter="latex");
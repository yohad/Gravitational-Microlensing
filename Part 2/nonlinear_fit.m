function [u_min, tau, dist] = nonlinear_fit(path, u_min_range, tau_range, ...
    T_0, m_0)
data = load(path);

t = data(:, 1);
t_offset = t(1);
t = t - t_offset;
m = data(:, 2);
sigma_m = data(:, 3);

F = 10.^(0.4*(m_0-m));
sigma_F = 10.^(0.4*(m_0-m)) * log(10) * 0.4 .* sigma_m;

T_0 = T_0 - t_offset;

chi_mat = zeros(length(u_min_range), length(tau_range));
for i = 1:length(u_min_range)
    for j = 1:length(tau_range)
        f = mag(u_min_range(i), tau_range(j), T_0, t);
        chi_mat(i, j) = chi(F, f, sigma_F);
    end
end

[cursor, dist] = matrix_min(chi_mat);
i = cursor(1);
j = cursor(2);
u_min = u_min_range(i);
tau = tau_range(j);
fprintf("u_min: %f, tau: %f, chi^2: %d\n",...
    u_min_range(i), tau_range(j), dist);

contour(tau_range, u_min_range, chi_mat - dist, [2.3, 4.61, 6.18, 9.21], ...
    "ShowText", "on");
xlabel("$\tau$", Interpreter="latex");
ylabel("$u_{min}$", Interpreter="latex");

figure
hold on
errorbar(t + t_offset, F, sigma_F, ".");
t = linspace(t(1), t(end), 10000);
f = mag(u_min, tau, T_0, t);
plot(t + t_offset, f, Color="red");
[~, name, ~] = fileparts(path);
txt = sprintf("%s", name);
title(txt, Interpreter="none");
xlabel("T[JD]");
ylabel("$\mu$", "Interpreter", "latex");
legend("Data", "Fitted Function");
hold off

end


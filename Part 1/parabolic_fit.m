data = load("SMC_001.dat");
i1 = 500;
i2 = 530;

ts = data(i1:i2, 1);
t_offset = ts(1);
ts = ts - t_offset;
ms = data(i1:i2, 2);
sigma_m = data(i1:i2, 3);

Fs = 10.^(-0.4*ms);
sigma_F = 10.^(-0.4*ms) * log(10) * 0.4 .* sigma_m;

[a, b, c, dist] = fit(ts, Fs, sigma_F);

hold on
errorbar(ts+t_offset, Fs, sigma_F, ".");
fit_t = linspace(ts(1), ts(end), 300);
plot(fit_t+t_offset, poly(fit_t, a, b, c))

xlabel("T [JD]");
ylabel("$\mu$", Interpreter="latex")
title("Microlensing Event for SMC001")
T0 = -b / (2*a) + t_offset;
sprintf('T0: %f', T0)
xline(T0)
legend("Raw Data", "Parabolic Fit", "Microlensing Event");
hold off
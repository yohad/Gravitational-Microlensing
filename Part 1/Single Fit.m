a = 1;
b = 2;
c = 3;
sigma = 1;

xs = linspace(-1, 1, 30);
as = [];
bs = [];
cs = [];
dists = [];

[ys, ss] = generate(xs, a, b, c, 0.3, 0.1);
[a_new, b_new, c_new, dist] = fit(xs, ys, ss);

hold on
errorbar(xs, ys, ss, ".");
plot(xs, poly(xs, a, b, c), Color="red");
fit_poly = poly(xs, a_new, b_new, c_new);
plot(xs, fit_poly, Color="black");

text_x = min(xs) + 0.1*(max(xs) - min(xs));
text_y = max(ys) - 0.1*(max(ys) - min(ys));
txt = sprintf("Fit: $%.2fx^2+%.2fx+%.2f$\n$\\chi^2=%.2f$", ...
    a_new, b_new, c_new, dist);
text(text_x, text_y, ...
    txt, ...
    Interpreter="latex", BackgroundColor="white");

legend("Simulated data points", "True Function", "Fitted Function");
xlabel("x");
ylabel("y");
txt = sprintf("Fit of Parabolic Equation $%dx^2+%dx+%d$, $\\sigma^2=%.2f$", ...
    a, b, c, sigma);
title(txt, Interpreter="latex");
hold off




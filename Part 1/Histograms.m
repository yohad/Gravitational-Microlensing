a = 1;
b = -5;
c =3;
sigma = 1;

xs = linspace(-1, 1, 100);
as = [];
bs = [];
cs = [];
dists = [];

for i = 1:10000
    [ys, ss] = generate(xs, a, b, c, sigma, 0.1);
    [a_new, b_new, c_new, dist] = fit(xs, ys, ss);
    as(end+1) = a_new;
    bs(end+1) = b_new;
    cs(end+1) = c_new;
    dists(end+1) = dist;
end

figure
subplot(3, 1, 1);
histogram(as, 20);
xlabel("$a$", Interpreter="latex");
ylabel("occurrences");
txt = sprintf("$a$ distribution with $\\sigma_a = %.3f$", std(as));
title(txt, Interpreter="latex");


subplot(3, 1, 2);
histogram(bs, 20);
xlabel("$b$", Interpreter="latex");
ylabel("occurrences");
txt = sprintf("$b$ distribution with $\\sigma_b = %.3f$", std(bs));
title(txt, Interpreter="latex");

subplot(3, 1, 3);
histogram(cs, 20);
xlabel("$c$", Interpreter="latex");
ylabel("occurrences");
txt = sprintf("$c$ distribution with $\\sigma_c = %.3f$", std(cs));
title(txt, Interpreter="latex");



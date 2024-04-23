a = 1;
b = -5;
c =3;
sigma = 1;

xs = linspace(-1, 1, 100);
as = [];
bs = [];
cs = [];
dists = [];

L = 10000;
for i = 1:L
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
ylabel("N");
txt = sprintf("$a = %.3f \\pm %.3f$", mean(as), std(as) / sqrt(L));
title(txt, Interpreter="latex");


subplot(3, 1, 2);
histogram(bs, 20);
xlabel("$b$", Interpreter="latex");
ylabel("N");
txt = sprintf("$b = %.3f \\pm %.3f$", mean(bs), std(bs) / sqrt(L));
title(txt, Interpreter="latex");

subplot(3, 1, 3);
histogram(cs, 20);
xlabel("$c$", Interpreter="latex");
ylabel("N");
txt = sprintf("$c = %.3f \\pm %.3f$", mean(cs), std(cs) / sqrt(L));
title(txt, Interpreter="latex");



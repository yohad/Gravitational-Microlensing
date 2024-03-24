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
    [ys, ss] = generate(xs, a, b, c, 0.3, 0.1);
    [a_new, b_new, c_new, dist] = fit(xs, ys, ss);
    as(end+1) = a_new;
    bs(end+1) = b_new;
    cs(end+1) = c_new;
    dists(end+1) = dist;
end

hold on
errorbar(xs, ys, ss, ".");
plot(xs, poly(xs, a, b, c));
hold off




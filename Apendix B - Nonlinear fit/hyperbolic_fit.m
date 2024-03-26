xs = linspace(1, 4, 40);
ys = linspace(-1, 3, 40);

ds = func(xs, ys, 1.5, 1.7);

[i, j, chi] = matrix_min(ds)
xs(i), ys(j)

function ds = func(xs, ys, x_0, y_0)
    ds = transpose((xs - x_0).^2) + (ys - y_0).^2;
end
x = linspace(0, 10, 100);
y = linspace(0, 10, 100);

a = 4;
b = 6;

z = zeros(length(x), length(y));
for i = 1:length(x)
    for j = 1:length(y)
        z(i, j) = (x(i) - a)^2 + (y(j)-b)^2;
    end
end

[cursor, min_val] = matrix_min(z);
i = cursor(1);
j = cursor(2);

x(i)
y(j)


figure
subplot(3, 1, 1)
hold on
histogram(u_min_store, 7);
txt = sprintf("$u_{min} = %.3f \\pm %.3f$", mean(u_min_store), ...
    std(u_min_store) / sqrt(length(u_min_store)));
title(txt, "Interpreter", "latex");
xlabel("$u_{min}$", "Interpreter", "latex");
hold off

subplot(3, 1, 2)
hold on
histogram(tau_store);
txt = sprintf("$\\tau = %.3f \\pm %.3f$", mean(tau_store), ...
    std(tau_store) / sqrt(length(tau_store)));
title(txt, "Interpreter", "latex");
xlabel("$\tau [JD]$", "Interpreter", "latex");
hold off

subplot(3, 1, 3)
hold on
histogram(dist_store);
txt = sprintf("$\\chi^2 = %.3f \\pm %.3f$", mean(dist_store), ...
    std(dist_store) / sqrt(length(dist_store)));
title(txt, "Interpreter", "latex");
xlabel("$\chi^2$", "Interpreter", "latex");
hold off

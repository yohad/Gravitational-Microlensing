function sim_data = sim(time, err, r_tau, r_umin, t_0)
  data_no_err = mag(r_umin, r_tau, t_0, time);
  sim_data = zeros(length(time), 1);
  for i = 1:length(sim_data)
    sim_data(i) = normrnd(data_no_err(i), err(i));
  end
end
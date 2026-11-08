// neg_binomial_offset.stan
// Modelo Binomial Negativa con offset logarítmico de población.
// La parametrización de Stan usa neg_binomial_2(mu, phi), donde phi controla
// la sobredispersión: var(y) = mu + mu^2 / phi.

data {
  int<lower=1> N;
  int<lower=0> K;
  matrix[N, K] X;
  array[N] int<lower=0> y;
  vector[N] log_offset;
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> phi;          // parámetro de dispersión / forma
}

transformed parameters {
  vector[N] mu;
  mu = exp(log_offset + X * beta + alpha);
}

model {
  alpha ~ normal(0, 1);
  beta ~ normal(0, 1);
  phi ~ gamma(2, 0.1);

  y ~ neg_binomial_2(mu, phi);
}

generated quantities {
  vector[N] log_lik;
  array[N] int y_rep;

  for (n in 1:N) {
    log_lik[n] = neg_binomial_2_lpmf(y[n] | mu[n], phi);
    y_rep[n] = neg_binomial_2_rng(mu[n], phi);
  }
}

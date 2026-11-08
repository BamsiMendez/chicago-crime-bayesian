// poisson_offset.stan
// Modelo Poisson con offset logarítmico de población.
// En Stan, el archivo se divide en bloques claros:
// - data: entrada fija que llega desde Python.
// - parameters: los parámetros desconocidos que queremos inferir.
// - transformed parameters: cálculos derivados usados por el modelo.
// - model: la prior y la verosimilitud, donde se define la posterior.
// - generated quantities: cantidades simuladas/predictivas para diagnóstico y PPC.

data {
  int<lower=1> N;              // número de áreas comunitarias
  int<lower=0> K;              // número de covariables en el predictor lineal
  matrix[N, K] X;              // matriz de covariables estandarizadas
  array[N] int<lower=0> y;     // conteos de crímenes
  vector[N] log_offset;        // offset logarítmico de población
}

parameters {
  real alpha;                  // intercepto en escala logarítmica
  vector[K] beta;              // coeficientes de regresión
}

transformed parameters {
  vector[N] mu;                // media del Poisson en escala original
  mu = exp(log_offset + X * beta + alpha);
}

model {
  // Priors débilmente informativas: con variables estandarizadas,
  // una Normal(0, 1) es razonable y evita efectos extremos no realistas.
  alpha ~ normal(0, 1);
  beta ~ normal(0, 1);

  // Verosimilitud Poisson para los conteos de crimen.
  y ~ poisson(mu);
}

generated quantities {
  vector[N] log_lik;
  array[N] int y_rep;

  for (n in 1:N) {
    log_lik[n] = poisson_lpmf(y[n] | mu[n]);
    y_rep[n] = poisson_rng(mu[n]);
  }
}

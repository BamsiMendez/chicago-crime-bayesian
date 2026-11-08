# Resultados archivados de la ejecución original

Extraídos de las salidas guardadas de notebook_6.ipynb. No son una nueva ejecución.

## Convergencia (celda original 36)

```text
================================================================================
DIAGNÓSTICOS DE CONVERGENCIA
================================================================================

  Modelo  Rhat_max  ESS_bulk_min  ESS_tail_min  Divergencias  Tiempo (s)  \
0     M1    1.0031          1520          1426             0        2.07   
1     M2    1.0046          1463          1465             0        1.50   
2     M3    1.0029           961          1276             0        1.46   
3     M4    1.0028          1887          2294             0        4.21   
4     M5    1.0031          1754          1980             0        3.04   

  Estado  
0   ✅ OK  
1   ✅ OK  
2   ✅ OK  
3   ✅ OK  
4   ✅ OK
```

## WAIC y LOO (celda original 51)

```text
==========================================================================================
TABLA COMPARATIVA DE MODELOS
==========================================================================================
Modelo       WAIC    SE_WAIC   elpd_loo     SE_LOO     Tipo  K_vars    Δ_WAIC     Δelpd
    M1 -223171.44 62839.3685 -208218.63 57433.6095  Poisson       2 222360.16 207407.18
    M2 -146097.60 37202.7751 -131071.15 31845.7307  Poisson       3 145286.32 130259.70
    M3 -151599.09 35885.1155 -139023.13 31836.4453  Poisson       3 150787.81 138211.68
    M4    -825.34    14.6302    -825.63    14.8561 Neg. Bin       2     14.06     14.18
    M5    -811.28    11.1782    -811.45    11.2503 Neg. Bin       3      0.00      0.00
==========================================================================================

📊 INTERPRETACIÓN (escala elpd: Δ = 0 es el mejor modelo):
  • Δelpd < 4: Modelos con soporte sustancial
  • Δelpd 4-7: Soporte decreciente
  • Δelpd > 10: Modelo descartable
  • Lo mismo aplica para Δ_WAIC
```

## Comparación con ArviZ (celda original 52)

```text
==========================================================================================
COMPARACIÓN FORMAL DE MODELOS (az.compare)
==========================================================================================

    rank       elpd_loo        p_loo      elpd_diff        weight            se           dse  warning scale
M5     0    -811.448607     7.344568       0.000000  9.042611e-01     11.250300      0.000000    False   log
M4     1    -825.633577     6.877035      14.184970  9.573894e-02     14.856146      7.279217     True   log
M2     2 -131071.152123  4386.303902  130259.703516  2.897199e-11  31845.730673  31836.054584     True   log
M3     3 -139023.132390  4355.218359  138211.683783  1.635164e-11  31836.445290  31827.663755     True   log
M1     4 -208218.629653  4470.754695  207407.181046  0.000000e+00  57433.609546  57425.414975     True   log

📋 COLUMNAS CLAVE:
  • rank: orden de mejor (0) a peor desempeño predictivo
  • elpd_loo: expected log pointwise predictive density (mayor es mejor)
  • p_loo: número efectivo de parámetros (complejidad penalizada)
  • d_loo: diferencia de elpd_loo respecto al mejor modelo
  • weight: peso de stacking (útil para promediar modelos, 0-1)
  • se: error estándar de elpd_loo
  • dse: error estándar de la diferencia d_loo (¡no es solo la resta de los SE individuales!)
  • warning: True si hay k-hat > 0.7 en ese modelo (revisar Fase 5.6)

<Figure size 600x500 with 1 Axes>
```

## Pareto k (celda original 54)

```text
================================================================================
DIAGNÓSTICO DETALLADO DE K-HAT (OBSERVACIONES INFLUYENTES)
================================================================================

Modelo  k < 0.5  k [0.5-0.7)  k [0.7-1.0)  k >= 1.0    LOO_confiable
    M1        8            2            4        63 No ⚠️ (67 malos)
    M2       11            5            5        56 No ⚠️ (61 malos)
    M3        8            2            8        59 No ⚠️ (67 malos)
    M4       76            0            0         1  No ⚠️ (1 malos)
    M5       75            2            0         0             Sí ✓

📋 INTERPRETACIÓN DE K-HAT:
  • k < 0.5: Observación bien-comportada (ideal)
  • 0.5 <= k < 0.7: Observación moderadamente influyente (aceptable)
  • 0.7 <= k < 1.0: Observación muy influyente (LOO puede ser inestable)
  • k >= 1.0: Observación extremadamente influyente (LOO no confiable)
```

## Comparación predictiva (celda original 65)

```text
Modelo           MAE          RMSE        R2     MAPE_%
0    GradientBoosting   8502.941435  11254.415796  0.774060  34.988026
1  Bayesian (ganador)   8536.872677  12378.570050  0.726670  40.413966
2        RandomForest  11448.573333  14569.169406  0.621369  51.600123
3               Ridge  12348.602333  16497.799864  0.514489  66.448237

Archivo guardado: phase6_comparison_metrics.csv
```

## Escenario usando el ajuste (celda original 71)

```text
================================================================================
ANÁLISIS CONTRAFÁCTICO Y SIMULACIÓN DE ESCENARIOS (MODELO M5)
================================================================================

         Área Comunitaria  Observado Real  Predicción Base M5  \
0  Greater Grand Crossing           70406             49349.1   
1         Washington Park           27216             41194.9   
2                 Oakland            8001             14937.4   
3               Riverdale           13654             53382.9   
4          West Englewood           64374             86792.4   

   Predicción Post-Intervención  Crímenes Mitigados  Mitigación %  
0                       29168.3             20180.8         40.89  
1                       24356.7             16838.2         40.87  
2                        8807.4              6130.0         41.04  
3                       31604.5             21778.4         40.80  
4                       50587.4             36205.0         41.71  
<Figure size 1000x500 with 1 Axes>

[✓] Fase 7.4: Simulación de escenarios de impacto completada con éxito.
================================================================================
```
